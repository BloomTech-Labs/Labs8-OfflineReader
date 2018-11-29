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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let insets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        oneYearButton.titleEdgeInsets = insets
        fiveYearButton.titleEdgeInsets = insets
        oneYearButton.titleLabel?.textAlignment = .center
        fiveYearButton.titleLabel?.textAlignment = .center
    }
    
    @IBOutlet weak var oneYearButton: UIButton!
    @IBOutlet weak var fiveYearButton: UIButton!
    
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
