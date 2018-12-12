//
//  UserDefaultsThemeHelper.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/15/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class ThemeHelper {

    // MARK: - Font name enum

    public enum FontName: String {
        case defaultBody = "Helvetica"
        case defaultTitle = "Helvetica-Bold"
    }

    private enum ThemeColor: String {
        case black
        case white
        case tan
        case darkBrown
        case lightGray
        case darkGray
    }
    
    public enum Theme: String {
        case white
        case tan
        case lightGray
        case night
    }

    // MARK: - User Defaults Keys

    static let textColorKey = "textColor"
    static let customTextColorKey = "customTextColor"
    static let backgroundColorKey = "backgroundColor"
    static let customBackgroundColorKey = "customBackgroundColor"
    static let fontSizeKey = "fontSize"
    static let bodyFontKey = "bodyFont"
    static let titleFontKey = "titleFont"
    static let isNightModeKey = "isNightMode"
    static let lastStoredThemeKey = "lastStoredTheme"


    // MARK: - Static properties

    static let shared = ThemeHelper()


    // MARK: - Public properties

    /**
     Computed property that returns the status of Night Mode in UserDefaults.
     
     Night Mode is a UISwitch in the detail view that sets a dark grey theme.
     
     - Author: Conner Alegre
     */
    public var isNightMode: Bool {
        return defaults.bool(forKey: ThemeHelper.isNightModeKey)
    }
    /**
     The size difference between the body and title fonts as a CGPoint.
     
     Default value of 12.0
     */
    public var diffBetweenBodyAndTitle: CGFloat = 12.0
    

    // MARK: - Private properties

    private let defaults = UserDefaults.standard


    // MARK: - Private functions

    /**
     Returns a UIColor when given an instance of the ThemeHelper.Color enum
     
     - Parameters:
        - color: The desired color as an instance of the ThemeHelper.Color enum
     - Returns: UIColor
     - Author: Samantha Gatt
     */
    private func color(from themeColor: ThemeHelper.ThemeColor) -> UIColor {

        switch themeColor {
        case .black:
            return .black
        case .white:
            return .white
        case .tan:
            return UIColor(red: 0.79, green: 0.73, blue: 0.58, alpha: 1.0)
        case .darkBrown:
            return UIColor(red:0.25, green:0.16, blue:0.08, alpha:1.0)
        case .lightGray:
            return UIColor(red: 0.30, green: 0.30, blue: 0.30, alpha: 1.0)
        case .darkGray:
            return UIColor(red: 0.17, green: 0.17, blue: 0.17, alpha: 1.0)
        }
    }

    /**
     Returns a UIColor when given a string
     
     Should only be used with strings stored in user defaults. Any string that is not equal to one of the raw values for ThemeHelper.Color enum instances will return UIColor.black
     
     - Parameters:
        - string: The desired color as a string matching an instance of the UserDefaultsThemeHelper.Color enum raw value
     - Returns: UIColor
     - Author: Samantha Gatt
     */
    private func color(from string: String) -> UIColor {
        let themeColor = ThemeHelper.ThemeColor(rawValue: string) ?? .black
        return color(from: themeColor)
    }
    
    
    /**
     Stores the chosen text color in UserDefaults as a String
     
     Sets the chosen background color in UserDefaults with UserDefaultsThemeHelper.backgroundColorKey as the key. The color is stored as a String.
     
     - Parameter providedColor: The color of the background based on the UserDefaultsThemeHelper.ProvidedColors enum
     - Parameter customColor: A custom UIColor
     - Author: Samantha Gatt
     */
    private func setBackgroundColor(themeColor: ThemeHelper.ThemeColor) {
        defaults.set(themeColor.rawValue, forKey: ThemeHelper.backgroundColorKey)
    }
    
    /**
     Stores the chosen text color in UserDefaults as a String
     
     Sets the chosen text color in UserDefaults with UserDefaultsThemeHelper.textColorKey as the key. The color is stored as a String.
     
     - Parameter providedColor: The color of the font based on the UserDefaultsThemeHelper.ProvidedColors enum
     - Parameter customColor: A custom UIColor
     - Author: Samantha Gatt
     */
    private func setTextColor(themeColor: ThemeHelper.ThemeColor) {
        defaults.set(themeColor.rawValue, forKey: ThemeHelper.textColorKey)
    }
    
    /**
     
     */
    private func storeTheme(_ theme: ThemeHelper.Theme) {
        if theme != .night {
            defaults.set(theme.rawValue, forKey: ThemeHelper.lastStoredThemeKey)
        }
    }
    
    /**
     Handles setting the text and background colors for each theme in UserDefaults
     
     - Parameters:
     - theme: The instance of the ThemeHelper.Theme enum that is desired
     
     - Authors:
     - Conner Alegre
     - Samantha Gatt
     */
    private func setTheme(to theme: ThemeHelper.Theme) {
        switch theme {
        case .white:
            setTextColor(themeColor: .black)
            setBackgroundColor(themeColor: .white)
        case .tan:
            setTextColor(themeColor: .darkBrown)
            setBackgroundColor(themeColor: .tan)
        case .lightGray:
            setTextColor(themeColor: .white)
            setBackgroundColor(themeColor: .lightGray)
        case .night:
            setTextColor(themeColor: .white)
            setBackgroundColor(themeColor: .darkGray)
        }
        
        if theme != .night {
            defaults.set(false, forKey: ThemeHelper.isNightModeKey)
            storeTheme(theme)
        } else {
            defaults.set(true, forKey: ThemeHelper.isNightModeKey)
        }
    }
    

    // MARK: - Public functions

    public func getLastStoredTheme() -> ThemeHelper.Theme {
        let storedString = defaults.string(forKey: ThemeHelper.lastStoredThemeKey) ?? "white"
        return ThemeHelper.Theme(rawValue: storedString) ?? .white
    }
    
    
    // MARK: Font
    
    /**
    Returns the current title font stored in UserDefaults
     
    Gets the current font set in UserDefaults and determines the size the title font which is based on the difference between the body font size and title font size.

    - Returns: UIFont
    - Author: Samantha Gatt
    */
    public func getTitleFont() -> UIFont {
        let bodySize = defaults.object(forKey: ThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let size = bodySize + diffBetweenBodyAndTitle
        let name = defaults.string(forKey: ThemeHelper.titleFontKey) ?? ThemeHelper.FontName.defaultTitle.rawValue
        return UIFont(name: name, size: size)!
    }

    /**
     Returns the current body font stored in UserDefaults
 
     Gets the current font set in UserDefaults and determines the size the body font which is based on the difference between the title font size and body font size.
 
     - Returns: The current body font stored in UserDefaults
     - Author: Samantha Gatt
    */
    public func getBodyFont() -> UIFont {
        let size = defaults.object(forKey: ThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let name = defaults.string(forKey: ThemeHelper.bodyFontKey) ?? UIFont.preferredFont(forTextStyle: .body).fontName
        return UIFont(name: name, size: size) ?? UIFont.preferredFont(forTextStyle: .body)
    }
    
    /**
     Stores the body font in UserDefaults if parameters are non-nil.
     
     Title font does not need to be set. The font name will always be the same as the body font. If you would like to change the difference between the body and title font sizes, set diffBetweenBodyAndTitle public variable.
     
     - Parameters:
        - name: The name of the font chosen. If nil, nothing changes.
        - size: The size of the font. If nil, nothing changes.
     - Author: Samantha Gatt
    */
    public func setFont(name: ThemeHelper.FontName? = nil, size: CGFloat? = nil) {
        if let fontSize = size {
            defaults.set(fontSize, forKey: ThemeHelper.fontSizeKey)
        }
        if let fontName = name {
            defaults.set(fontName.rawValue, forKey: ThemeHelper.bodyFontKey)
        }
    }

    // MARK: Text color
    
    /**
     Returns the current text color stored in UserDefaults
 
     - Returns: The current font color stored in UserDefaults
     - Author: Samantha Gatt
    */
    public func getTextColor() -> UIColor {
        if let colorString = defaults.string(forKey: ThemeHelper.textColorKey) {
            return color(from: colorString)
        } else {
            return .black
        }
    }

    // MARK: Background color
    
    /**
     Returns the current background color stored in UserDefaults
 
     Gets the current background color stored and UserDefaults and returns it accordingly. If there is nothing stored in UserDefaults, it defaults to a white color.
 
     - Returns: The current background color stored in UserDefaults
     - Author: Samantha Gatt
    */
    public func getBackgroundColor() -> UIColor {
        if let colorString = defaults.string(forKey: ThemeHelper.backgroundColorKey) {
            return color(from: colorString)
        } else {
            return .white
        }
    }
    
    /**
     Returns the color closest to the color of the nav bar for the current background color
     
     The nav bar lightens the UIColor past into its `barTintColor` property, so this function returns the UIColor closest to that.
     
     - Author: Samantha Gatt
     
     - Returns: UIColor for search bar
     */
    public func getSearchBarColor() -> UIColor {
        switch getBackgroundColor() {
        case color(from: .tan):
            return UIColor(red:0.80, green:0.74, blue:0.63, alpha:1.0)
        case color(from: .lightGray):
            return UIColor(red:0.40, green:0.40, blue:0.40, alpha:1.0)
        case color(from: .darkGray):
            return UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.0)
        default:
            return .white
        }
    }
    
    
    // MARK: Setting themes
    
    /**
     Sets text color and background color for white theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setWhiteTheme() {
        setTheme(to: .white)
    }
    
    /**
     Sets text color and background color for tan theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setTanTheme() {
        setTheme(to: .tan)
    }
    
    /**
     Sets text color and background color for light gray theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setLightGrayTheme() {
        setTheme(to: .lightGray)
    }
    
    /**
     Stores a bool in UserDefaults for keeping track of Night Mode
     
     Night Mode is a UISwitch in the detail view that sets a dark grey theme.
     
     - Author: Conner Alegre
     */
    public func toggleNightMode() {
        if defaults.bool(forKey: ThemeHelper.isNightModeKey) {
            let lastTheme = getLastStoredTheme()
            setTheme(to: lastTheme)
            defaults.set(false, forKey: ThemeHelper.isNightModeKey)
        } else {
            setTheme(to: .night)
            defaults.set(true, forKey: ThemeHelper.isNightModeKey)
        }
    }
}
