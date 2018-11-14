//
//  SavedCollectionViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ContentCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
    
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DocumentCell", for: indexPath) as! DocumentCollectionViewCell
        
        cell.updateViews()
    
        return cell
    }
}
