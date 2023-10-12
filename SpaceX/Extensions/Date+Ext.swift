//
//  Date+Ext.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import Foundation

extension Date {
    
    func dayMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    func getComponentValue(_ component: Calendar.Component) -> String {
        String(Calendar.current.component(component, from: self))
    }
}
