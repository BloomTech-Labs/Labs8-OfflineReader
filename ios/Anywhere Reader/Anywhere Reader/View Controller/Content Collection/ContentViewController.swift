//
//  ContentViewController.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/12/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import CoreData
import FacebookCore

private let reuseIdentifier = "ArticleCell"

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.shared.verifyAccessToken(with: AccessToken.current!.authenticationToken) { (result, error) in
            if result == .success {
                self.articleController.fetchArticles() { (error) in
                    if let error = error {
                        NSLog("Error fetching articles: \(error)")
                        return
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSearchBar()
        setupNavBarAndBackground()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        searchBar.resignFirstResponder()
    }
    
    
    // MARK: - Properties
    
    let themeHelper = ThemeHelper.shared
    
    /**
     Cache of animations to execute when the fetched Articles in CoreData are modified
     
     Only used in the [NSFetchedResultsControllerDelegate](https://developer.apple.com/documentation/coredata/nsfetchedresultscontrollerdelegate) extension
     
     - Author: Samantha Gatt
     */
    private var blockOperations: [BlockOperation] = []
    lazy var fetchedResultsController: NSFetchedResultsController<Article> = {
        return setupFRC()
    }()
    
    private let articleController = ArticleController()
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        if themeHelper.isNightMode || themeHelper.getLastStoredTheme() == .lightGray {
            return .lightContent
        } else {
            return .default
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Actions
    
    @IBAction func addNewContent(_ sender: Any) {
        let addLinkDialog = UIAlertController(title: "Add", message: "Insert article link", preferredStyle: .alert)
        let save = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            if let url = addLinkDialog.textFields?[0].text {
                self.articleController.scrape(with: url) { _ in }
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        addLinkDialog.addAction(save)
        addLinkDialog.addAction(cancel)
        addLinkDialog.addTextField { (textField) -> Void in
            textField.placeholder = "http://cnn.com"
            // Autopopulate textfield if there is something in the users clipboard
            if let linkInClipboard = UIPasteboard.general.string {
                textField.text = linkInClipboard
            }
            textField.layer.borderColor = UIColor.darkGray.cgColor
        }
        self.present(addLinkDialog, animated: true, completion: nil)
    }
    

    // MARK: - Private functions
    
    private func setupSearchBar() {
        // Matches the search bar color to the navigation bar, since the nav bar lightens the r g and b values of the background color by 30
        searchBar.backgroundColor = themeHelper.getSearchBarColor()
        
        // TextField Color Customization
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = themeHelper.isNightMode ? themeHelper.getTextColor() : .darkGray
    }
    
    private func setupNavBarAndBackground() {
        // Gets rid of bottom border of navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.barTintColor = themeHelper.getBackgroundColor()
        navigationController?.navigationBar.tintColor = themeHelper.getTextColor()
        collectionView.backgroundColor = themeHelper.getBackgroundColor()
    }
    
    private func setupFRC(searchText: String? = nil) -> NSFetchedResultsController<Article> {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        if let searchText = searchText {
            let predicate = NSPredicate(format: "text CONTAINS %@", searchText)
            fetchRequest.predicate = predicate
        }
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.moc, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        try! frc.performFetch()
        return frc
    }
    
    @objc private func deleteArticle(sender: UIButton) {
        let indexPath = sender.layer.value(forKey: "indexPath") as! IndexPath
        let article = self.fetchedResultsController.object(at: indexPath)
        let deleteDialog = UIAlertController(title: "Delete", message: "Are you sure you want to delete the content titled \"\(article.title ?? "")?", preferredStyle: .alert)
        let delete = UIAlertAction(title: "Delete", style: .default, handler: { (action) -> Void in
            // Delete remotely (on Server)
            self.articleController.delete(articleId: article.id) { (error) in
                if let error = error {
                    NSLog("Error deleting article remotely: \(error)")
                    return
                } else {
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
            // Delete locally (in CoreData)
            self.articleController.delete(article: article, context: CoreDataStack.moc)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        deleteDialog.addAction(delete)
        deleteDialog.addAction(cancel)
        self.present(deleteDialog, animated: true, completion: nil)
    }
    
    
    // MARK: UICollectionView Transition
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ContentDetailViewController {
            let cell = sender as! ArticleCollectionViewCell
            guard let indexPath = self.collectionView!.indexPath(for: cell) else { return }
            let article = fetchedResultsController.object(at: indexPath)
            let _ = detailViewController.view
            detailViewController.article = article
        }
    }
}

extension ContentViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        blockOperations.removeAll(keepingCapacity: false)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        
        let op: BlockOperation
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            op = BlockOperation { self.collectionView?.insertItems(at: [newIndexPath]) }
        case .delete:
            guard let indexPath = indexPath else { return }
            op = BlockOperation { self.collectionView?.deleteItems(at: [indexPath]) }
        case .update:
            guard let indexPath = indexPath else { return }
            op = BlockOperation { self.collectionView?.reloadItems(at: [indexPath]) }
        case .move:
            guard let indexPath = indexPath,  let newIndexPath = newIndexPath else { return }
            op = BlockOperation { self.collectionView?.moveItem(at: indexPath, to: newIndexPath) }
        }
        
        blockOperations.append(op)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        var op: BlockOperation?
        switch type {
        case .insert:
            op = BlockOperation { self.collectionView?.insertSections(IndexSet(integer: sectionIndex)) }
        case .delete:
            op = BlockOperation { self.collectionView?.deleteSections(IndexSet(integer: sectionIndex)) }
        default:
            break
        }
        
        guard let newOp = op else { return }
        blockOperations.append(newOp)
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView?.performBatchUpdates({
            self.blockOperations.forEach { $0.start() }
        }, completion: { finished in
            self.blockOperations.removeAll(keepingCapacity: false)
        })
    }
}

extension ContentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArticleCollectionViewCell
        
        let article = fetchedResultsController.object(at: indexPath)
        cell.article = article
        cell.deleteButton.layer.setValue(indexPath, forKey: "indexPath")
        cell.deleteButton.addTarget(self, action: #selector(self.deleteArticle(sender:)), for: .touchUpInside)
        
        return cell
    }
}

extension ContentViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            fetchedResultsController = setupFRC()
            collectionView.reloadData()
        } else {
            fetchedResultsController = setupFRC(searchText: searchBar.text)
            collectionView.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
