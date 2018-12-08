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

    enum FontName: String {
        case defaultBody = "Helvetica"
        case defaultTitle = "Helvetica-Bold"
    }

    enum ThemeColor: String {
        case black
        case white
        case lightGray
        case tan
        case darkGray
    }

    // MARK: - User Defaults Keys

    static let textColorKey = "textColor"
    static let customTextColorKey = "customTextColor"
    static let backgroundColorKey = "backgroundColor"
    static let customBackgroundColorKey = "customBackgroundColor"
    static let fontSizeKey = "fontSize"
    static let bodyFontKey = "bodyFont"
    static let titleFontKey = "titleFont"


    // MARK: - Static properties

    static let shared = ThemeHelper()


    // MARK: - Public properties

    /**
     Computed property that returns the status of Night Mode in UserDefaults.
     
     Night Mode is a UISwitch in the detail view that sets a dark grey theme.
     
     - Author: Conner Alegre
     */
    public var isNightMode: Bool {
        return defaults.bool(forKey: "nightMode")
    }
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
        case .lightGray:
            return UIColor(red: 0.30, green: 0.30, blue: 0.30, alpha: 1.0)
        case .tan:
            return UIColor(red: 0.79, green: 0.73, blue: 0.58, alpha: 1.0)
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

    // MARK: - Public functions

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
    Stores the title font in UserDefaults
     - Parameters:
        - name: The name of the font chosen as an instance the UserDefaultsThemeHelper.FontName enum
        - size: The size of the font
    - Author: Samantha Gatt
    */
    public func setTitleFontName(name: ThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(name?.rawValue, forKey: ThemeHelper.bodyFontKey)
    }

    /**
        It determines the current body font stored in UserDefaults
     
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
         It stores the body font in UserDefaults
         - Parameter name: The name of the font chosen
         - Parameter size: The size of the font
         - Author: Samantha Gatt
    */
    public func setBodyFont(name: ThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(size, forKey: ThemeHelper.fontSizeKey)
        defaults.set(name?.rawValue, forKey: ThemeHelper.bodyFontKey)
    }

    /**
         It determines and returns the current text color stored in UserDefaults
     
         Gets the current font color in UserDefaults
     
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

    /**
        It stores the chosen text color in UserDefaults as a String

        Sets the chosen text color in UserDefaults with UserDefaultsThemeHelper.textColorKey as the key. The color is stored as a String.

        - Parameter providedColor: The color of the font based on the UserDefaultsThemeHelper.ProvidedColors enum
        - Parameter customColor: A custom UIColor
        - Author: Samantha Gatt
    */
    private func setTextColor(themeColor: ThemeHelper.ThemeColor) {
        defaults.set(themeColor.rawValue, forKey: ThemeHelper.textColorKey)
    }


    /**
         It determines the current background color stored in UserDefaults
     
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
        It stores the chosen text color in UserDefaults as a String

        Sets the chosen background color in UserDefaults with UserDefaultsThemeHelper.backgroundColorKey as the key. The color is stored as a String.

        - Parameter providedColor: The color of the background based on the UserDefaultsThemeHelper.ProvidedColors enum
        - Parameter customColor: A custom UIColor
        - Author: Samantha Gatt
    */
    private func setBackgroundColor(themeColor: ThemeHelper.ThemeColor) {
        defaults.set(themeColor.rawValue, forKey: ThemeHelper.backgroundColorKey)
    }

    /**
     Stores a bool in UserDefaults for keeping track of Night Mode
     
     Night Mode is a UISwitch in the detail view that sets a dark grey theme.
     
     - Author: Conner Alegre
    */
    public func toggleNightMode() {
        let status = defaults.bool(forKey: "nightMode")
        if status {
            defaults.set(false, forKey: "nightMode")
            setWhiteTheme()
        } else {
            defaults.set(true, forKey: "nightMode")
            setDarkGrayTheme()
        }
    }
    
    /**
     Sets text color and background color for white theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setWhiteTheme() {
        setTextColor(themeColor: .black)
        setBackgroundColor(themeColor: .white)
    }
    
    /**
     Sets text color and background color for tan theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setTanTheme() {
        setTextColor(themeColor: .black)
        setBackgroundColor(themeColor: .tan)
    }
    
    /**
     Sets text color and background color for light gray theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setLightGrayTheme() {
        setTextColor(themeColor: .white)
        setBackgroundColor(themeColor: .lightGray)
    }
    
    /**
     Sets text color and background color for dark gray theme in UserDefaults
     
     - Author: Conner Alegre
     */
    public func setDarkGrayTheme() {
        setTextColor(themeColor: .white)
        setBackgroundColor(themeColor: .darkGray)
    }
}
