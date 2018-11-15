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

        articleController.fetchLocalArticles()
    }
    
    
    // MARK: - Actions

    @IBAction func addNewContent(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddNewContent", bundle: nil)
        guard let addNewConentVC = storyboard.instantiateInitialViewController() else { return }
        addNewConentVC.providesPresentationContextTransitionStyle = true
        addNewConentVC.definesPresentationContext = true
        addNewConentVC.modalPresentationStyle = .overCurrentContext
        addNewConentVC.modalTransitionStyle = .crossDissolve
        
        self.present(addNewConentVC, animated: true, completion: nil)
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
    
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ContentDetailViewController {
            let cell = sender as! DocumentCollectionViewCell
            guard let indexPath = self.collectionView!.indexPath(for: cell) else { return }
            let _ = detailViewController.view
            detailViewController.article = articleController.articles[indexPath.row]
        }
    }
}
