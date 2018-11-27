//
//  BillingViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/7/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Stripe

class BillingViewController: UIViewController {

    @IBAction func confirmButtonTapped(_ sender: Any) {
        let addCardViewController = STPAddCardViewController()
        addCardViewController.delegate = self
        navigationController?.pushViewController(addCardViewController, animated: true)
    }
}

extension BillingViewController: STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        APIService.shared.completeCharge(with: token, amount: 999) { (result) in
            switch result {
            case .success:
                completion(nil)
                DispatchQueue.main.async { self.navigationController?.popViewController(animated: true) }
            default: ()
            }
        }
    }
}
