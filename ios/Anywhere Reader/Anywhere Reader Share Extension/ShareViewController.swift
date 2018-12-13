//
//  ShareViewController.swift
//  Anywhere Reader Share Extension
//
//  Created by Conner on 12/12/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {
    let sharedURL = "sharedURL"
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first {
                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                    itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (url, error) -> Void in
                        if let shareURL = url as? NSURL {
                            if let shareURLAsString = shareURL.absoluteString {
                                let sharedUserDefaults = UserDefaults(suiteName: "group.com.lambdaschool.AnywhereReader")
                                sharedUserDefaults?.set(shareURLAsString, forKey: self.sharedURL)
                                sharedUserDefaults?.synchronize()
                            }
                        }
                        self.extensionContext?.completeRequest(returningItems: [], completionHandler:nil)
                    })
                }
            }
        }
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
