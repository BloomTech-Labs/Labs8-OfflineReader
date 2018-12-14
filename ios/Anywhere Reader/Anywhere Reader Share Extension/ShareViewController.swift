//
//  ShareViewController.swift
//  Anywhere Reader Share Extension
//
//  Created by Conner on 12/12/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController {
    let sharedURLKey = "sharedURL"
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let alert = UIAlertController(title: nil, message: "Save this webpage to be viewed offline on Anywhere Reader?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            self.saveWebPageToUserDefaults()
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveWebPageToUserDefaults() {
        
        if let item = extensionContext?.inputItems.first as? NSExtensionItem,
            let itemProvider = item.attachments?.first,
            itemProvider.hasItemConformingToTypeIdentifier("public.url") {
            
            itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil) { url, error in
                if let shareURL = url as? NSURL, let shareURLAsString = shareURL.absoluteString {
                    let sharedUserDefaults = UserDefaults(suiteName: "group.com.lambdaschool.AnywhereReader")
                    sharedUserDefaults?.set(shareURLAsString, forKey: self.sharedURLKey)
                }
                self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
            }
        }
    }
}
