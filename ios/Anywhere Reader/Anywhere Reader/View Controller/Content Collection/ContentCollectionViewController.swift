//
//  SavedCollectionViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DocumentCell"

class ContentCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(DocumentCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        collectionView.register(UINib(nibName: "", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        articleController.fetchLocalArticles()
    }
    
    
    // MARK: - Actions

    @IBAction func addNewContent(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddNewContent", bundle: nil)
        guard let addNewContentVC = storyboard.instantiateInitialViewController() else { return }
        addNewContentVC.providesPresentationContextTransitionStyle = true
        addNewContentVC.definesPresentationContext = true
        addNewContentVC.modalPresentationStyle = .overCurrentContext
        addNewContentVC.modalTransitionStyle = .crossDissolve
        
        self.present(addNewContentVC, animated: true, completion: nil)
    }


    // MARK: - Properties
    
    let articleController = ArticleController()

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleController.articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DocumentCollectionViewCell
        
        let article = articleController.articles[indexPath.row]
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
            let article = articleController.articles[indexPath.row]
            let _ = detailViewController.view
            detailViewController.article = article
        }
    }
}
