//
//  Timer.swift
//  WorkLog
//
//  Created by Khanh T Pham on 11/12/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import Foundation

struct LogicNotification {
  static let name = Notification.Name(rawValue: "Logic Notification Name")
  static let key = "Logic Notification Key"
  static let timerDidFire = "Logic Notification Timer Did Fire"
  static let timerDidInvalidate = "Logic Notification Timer Did Invalidate"
}

class Logic {
  
  var timer: Timer?
  var intervalCount = 0
  
  func countDown() {
    
    let date = Date()
    
    var endTime: Date!
    
    let calendar = Calendar.current
    
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    
    var endTimeComponents = DateComponents()
    
    endTimeComponents.day = day
    endTimeComponents.month = month
    endTimeComponents.year = year
    endTimeComponents.hour = 24
    endTimeComponents.minute = 0
    endTimeComponents.second = 0
    
    endTime = calendar.date(from: endTimeComponents)
    
    intervalCount = Int(endTime.timeIntervalSince(date))
    
    timer = Timer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    
  }
  
  @objc private func handleTimer() {
    
    guard intervalCount == 0 else {
      return
    }
    
    intervalCount -= 1
    notifyObserver(message: LogicNotification.timerDidFire)
    
  }
  
  private func notifyObserver(message: String ) {
    
    let notification = Notification(name: LogicNotification.name, object: self, userInfo: [LogicNotification.key : message])
    
    Center.post(notification)
    
  }
  
}
