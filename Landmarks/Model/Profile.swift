import Foundation

//  Profile.swift
//  Landmarks
//
//  Created by Páll Arnold-Barna on 29.02.2024.
//

struct Profile {
    var username: String
    var preferNotifications = true
    var seasonalPhoto = Season.summer
    var goalDate = Date()
    
    static let `default` = Profile(username: "Pablo")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
