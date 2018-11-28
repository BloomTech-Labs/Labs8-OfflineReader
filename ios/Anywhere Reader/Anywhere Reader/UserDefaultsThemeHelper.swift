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
    
    enum ProvidedColors: String {
        case gray
        case tan
        case blue
        case green
        case custom
    }
    
    
    // MARK: - User Defaults Keys
    
    static let textColorKey = "textColor"
    static let customTextColorKey = "customTextColor"
    static let backgroundColorKey = "backgroundColor"
    static let customBackgroundColorKey = "cumstomBackgroundColor"
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
        return defaults.object(forKey: UserDefaultsThemeHelper.textColorKey) as? UIColor ?? .black
    }
    public func setLabelTextColor(_ color: UIColor) {
        defaults.set(color, forKey: UserDefaultsThemeHelper.textColorKey)
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
    
    public func getTextColor() -> UIColor {
        guard let colorString = defaults.string(forKey: UserDefaultsThemeHelper.textColorKey), let color = UserDefaultsThemeHelper.ProvidedColors(rawValue: colorString) else {
            return .black
        }
        switch color {
        case .gray:
            return .lightGray
        case .tan:
            return .lightGray
        case .blue:
            return .lightGray
        case .green:
            return .lightGray
        case .custom:
            return .lightGray
        }
    }
    public func setTextColor(providedColor: UserDefaultsThemeHelper.ProvidedColors, customColor: UIColor?) {
        defaults.set(providedColor.rawValue, forKey: UserDefaultsThemeHelper.textColorKey)
        if providedColor == .custom {
            defaults.set(customColor, forKey: UserDefaultsThemeHelper.customTextColorKey)
        }
    }
}
