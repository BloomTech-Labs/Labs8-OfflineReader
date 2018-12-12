//
//  AnywhereReaderProducts.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/12/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

public struct AnywhereReaderProducts {
    
    public static let oneYearPremium = "com.lambdaschool.AnywhereReader.One_Year_Premium"
    
    private static let productIdentifiers: Set<ProductIdentifier> = [AnywhereReaderProducts.oneYearPremium]
    
    public static let store = IAPHelper(productIds: AnywhereReaderProducts.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}
