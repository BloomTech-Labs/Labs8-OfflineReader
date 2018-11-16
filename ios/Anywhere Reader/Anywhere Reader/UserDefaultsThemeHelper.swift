//
//  UserDefaultsThemeHelper.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/15/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class UserDefaultsThemeHelper {
    
    // MARK: - Font name enum
    
    enum FontName: String {
        case defaultBody = "Helvetica"
        case defaultTitle = "Helvetica-Bold"
    }
    
    
    // MARK: - User Defaults Keys
    
    static let labelTextColorKey = "labelTextColor"
    static let backgroundColorKey = "backgroundColor"
    static let fontSizeKey = "fontSize"
    static let bodyFontKey = "bodyFont"
    static let titleFontKey = "titleFont"
    
    
    // MARK: - Shared instance
    
    static let shared = UserDefaultsThemeHelper()
    
    
    // MARK: - Public properties
    
    var diffBetweenBodyAndTitle: CGFloat = 12.0
    
    
    // MARK: - Private properties
    
    private let defaults = UserDefaults.standard
    
    
    // MARK: - Public functions
    
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
    
    public func getTitleFont() -> UIFont {
        let bodySize = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let size = bodySize + diffBetweenBodyAndTitle
        let name = defaults.string(forKey: UserDefaultsThemeHelper.titleFontKey) ?? UserDefaultsThemeHelper.FontName.defaultTitle.rawValue
        return UIFont(name: name, size: size)!
    }
    public func setTitleFontName(name: UserDefaultsThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(name?.rawValue, forKey: UserDefaultsThemeHelper.bodyFontKey)
    }
    
    public func getBodyFont() -> UIFont {
        let size = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let name = defaults.string(forKey: UserDefaultsThemeHelper.bodyFontKey) ?? UIFont.preferredFont(forTextStyle: .body).fontName
        return UIFont(name: name, size: size) ?? UIFont.preferredFont(forTextStyle: .body)
    }
    public func setBodyFont(name: UserDefaultsThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(size, forKey: UserDefaultsThemeHelper.fontSizeKey)
        defaults.set(name?.rawValue, forKey: UserDefaultsThemeHelper.bodyFontKey)
    }
}
