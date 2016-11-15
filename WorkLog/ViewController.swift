//
//  ViewController.swift
//  WorkLog
//
//  Created by Khanh T Pham on 10/28/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  fileprivate var model = Logic()
  
  private var clockView: ClockView!
  @IBAction func startButtonAction(_ sender: UIButton) {
  }
  
  @IBAction func endButtonAction(_ sender: UIButton) {
  }
  
  
  // MARK : Observer 
  
  func startObserver() {
    Center.addObserver(forName: LogicNotification.name, object: self, queue: OperationQueue.main) {
        (notification) in
      
      if let message = notification.userInfo?[LogicNotification.key] as? String {
        self.handleNotification(message: message)
      }
    }
  }
  
  func handleNotification(message: String) {
    clockView.updateUI()
  }
  
  // MARK : App Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    clockView = ClockView(frame: self.view.frame)
    clockView.delegate = self
    self.view.addSubview(clockView)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
  }
}

extension ViewController: ClockViewDelegate {
  
  func numberOfSecond() -> Int {
    return model.intervalCount
  }
  
  func animationShouldStart() -> Bool {
    return false
  }
  
}
