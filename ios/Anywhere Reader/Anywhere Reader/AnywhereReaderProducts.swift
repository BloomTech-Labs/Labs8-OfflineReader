//
//  AnywhereReaderProducts.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/7/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation
import StoreKit

class AnywhereReaderProducts {
    
    public static let oneYearPremiumID = Bundle.main.bundleIdentifier! + ".One_Year_Premium"
    
    private static let productIdentifiers: Set<ProductIdentifier> = [AnywhereReaderProducts.oneYearPremiumID]
    
    public static let store = IAPHelper(productIds: AnywhereReaderProducts.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}
