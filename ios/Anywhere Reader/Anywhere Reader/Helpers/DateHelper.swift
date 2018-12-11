//
//  DateHelper.swift
//  Anywhere Reader
//
//  Created by Conner on 12/11/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

class DateHelper {
    static let shared = DateHelper()
    let isoDateFormatter = ISO8601DateFormatter()
    let dateFormatter = DateFormatter()
    
    func ISODateToNormalDate(date: String) -> String {
        // Convert ISO8601 date to normal date, remove time
        isoDateFormatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: isoDateFormatter.date(from: date)!)
    }
}
