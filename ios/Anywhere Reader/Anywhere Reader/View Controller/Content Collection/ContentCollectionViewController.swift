//
//  SavedCollectionViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "DocumentCell"

class ContentCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        articleController.fetchArticles() { (error) in
            if let error = error {
                NSLog("Error fetching articles: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = themeHelper.getBackgroundColor()
        navigationController?.navigationBar.tintColor = themeHelper.getTextColor()
        collectionView.backgroundColor = themeHelper.getBackgroundColor()
    }
    
    // MARK: - Actions

    @IBAction func addNewContent(_ sender: Any) {
        let addLinkDialog = UIAlertController(title: "Add", message: "Insert article link", preferredStyle: .alert)
        let save = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            if let url = addLinkDialog.textFields?[0].text {
                self.articleController.scrape(with: url, completion: { (result) in
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                })
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        addLinkDialog.addAction(save)
        addLinkDialog.addAction(cancel)
        addLinkDialog.addTextField { (textField) -> Void in
            textField.placeholder = "http://cnn.com"
            textField.layer.borderColor = UIColor.darkGray.cgColor
        }
        self.present(addLinkDialog, animated: true, completion: nil)
    }

    // MARK: - Properties
    
    private let articleController = ArticleController(dataLoader: MockDataLoader.shared)
    let themeHelper = ThemeHelper.sharedr
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        let textColor = themeHelper.getTextColor()
        switch textColor {
        case .black:
            return .default
        case .white:
            return .lightContent
        default:
            return .lightContent
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleController.articleReps.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DocumentCollectionViewCell
        
        let article = articleController.articleReps[indexPath.row]
        cell.article = article
    
        return cell
    }
    
    // MARK: UICollectionView Transition
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ContentDetailViewController {
            let cell = sender as! DocumentCollectionViewCell
            guard let indexPath = self.collectionView!.indexPath(for: cell) else { return }
            let article = articleController.articleReps[indexPath.row]
            let _ = detailViewController.view
            detailViewController.article = article
        }
    }
}
