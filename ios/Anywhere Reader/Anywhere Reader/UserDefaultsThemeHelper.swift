//
//  UserDefaultsThemeHelper.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/15/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class UserDefaultsThemeHelper {
    
    static let shared = UserDefaultsThemeHelper()
    
    static let labelTextColorKey = "labelTextColor"
    static let backgroundColorKey = "backgroundColor"
    static let fontSizeKey = "fontSize"
    static let fontKey = "font"
    
    private let defaults = UserDefaults.standard
    
    public func getLabelTextColor() -> UIColor {
        return defaults.object(forKey: UserDefaultsThemeHelper.labelTextColorKey) as? UIColor ?? .black
    }
    public func setLabelTextColor(_ color: UIColor) {
        defaults.set(color, forKey: UserDefaultsThemeHelper.labelTextColorKey)
    }
    
    public func getBackgroundColor() -> UIColor {
        return defaults.object(forKey: UserDefaultsThemeHelper.backgroundColorKey) as? UIColor ?? .white
    }
    public func setBackgroundColor(_ color: UIColor) {
        defaults.set(color, forKey: UserDefaultsThemeHelper.backgroundColorKey)
    }
    
    public func getFont() -> UIFont {
        let size = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? UIFont.preferredFont(forTextStyle: .body).pointSize
        let name = defaults.string(forKey: UserDefaultsThemeHelper.fontKey) ?? UIFont.preferredFont(forTextStyle: .body).fontName
        return UIFont(name: name, size: size) ?? UIFont.preferredFont(forTextStyle: .body)
    }
    public func setFontSize(_ size: CGFloat) {
        defaults.set(size, forKey: UserDefaultsThemeHelper.fontSizeKey)
    }
}
