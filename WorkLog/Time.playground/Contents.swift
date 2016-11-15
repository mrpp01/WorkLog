//: Playground - noun: a place where people can play

import Foundation


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
  
  let timeInterval = endTime.timeIntervalSince(date)
  
  print("Hour: \(Int(timeInterval / 60 / 60)) minute: \(Int(timeInterval.truncatingRemainder(dividingBy: 3600)) / 60) second: \(Int(timeInterval.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60)))")
  
  
  
}
