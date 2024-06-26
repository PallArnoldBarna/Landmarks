import Foundation
import WatchKit
import SwiftUI
import UserNotifications

//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by Páll Arnold-Barna on 29.02.2024.
//

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["message"] as? String
        
        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
