//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-13.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
