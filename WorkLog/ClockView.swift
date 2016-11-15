//
//  Timer.swift
//  WorkLog
//
//  Created by Khanh T Pham on 11/4/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit

protocol ClockViewDelegate {
  
  func numberOfSecond() -> Int
  func animationShouldStart() -> Bool
}

class ClockView: UIView {
  
  var delegate: ClockViewDelegate!
  private var shapeLayer = CAShapeLayer()
  private var label: UILabel!
  private let animationDuration: Double = 60.0
  // MARK : Iniitalization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    createLabel()
    addCircle()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func addCircle() {
    
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: 160, y: 240),
                                  radius: CGFloat(100),
                                  startAngle: CGFloat(-M_PI_2),
                                  endAngle: CGFloat(2*M_PI-M_PI_2),
                                  clockwise: true)
    
    shapeLayer.path = circlePath.cgPath
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.blue.cgColor
    shapeLayer.lineWidth = 2.0
    
    self.layer.addSublayer(shapeLayer)
    
  }
  
  private func createLabel() {
    label = UILabel(frame: CGRect(x: 72, y: 220, width: 200, height: 40))
    label.font = UIFont(name: self.label.font.fontName, size: 40)
    label.textColor = UIColor.blue
    
    updateLabel()
    
    self.addSubview(label)
  }
  
  // MARK : Update UI
  
  func updateUI() {
    
    updateLabel()
    
  }
  
  private func startAnimation() {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = animationDuration
    animation.fillMode = kCAFillModeForwards
    animation.isRemovedOnCompletion = false
    
    shapeLayer.add(animation, forKey: "ani")
  }
  
  private func updateLabel() {
    
    guard delegate != nil else {
      self.label.text = timeFormatted(totalSeconds: 0)
      return
    }
    self.label.text = timeFormatted(totalSeconds: delegate!.numberOfSecond())
  }
  
  private func timeFormatted(totalSeconds: Int) -> String {
    let seconds = totalSeconds % 60
    let minutes = (totalSeconds / 60) % 60
    let hours = totalSeconds / 3600
    
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
  }
  
}

/*func updateScreenBrightness(percent: Double) {
 UIScreen.main.brightness = CGFloat(percent)
 }
 
 func adjustScreenBrightness() {
 testCount += 1
 print(testCount)
 let brightness = UIScreen.main.brightness
 print("brightness: \(brightness)")
 if brightness > 0 {
 UIScreen.main.brightness -= CGFloat(1)/60
 perform(#selector(adjustScreenBrightness), with: nil, afterDelay: 0.09)
 }
 }
 */

