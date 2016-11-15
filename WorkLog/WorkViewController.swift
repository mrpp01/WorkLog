//
//  WorkViewController.swift
//  WorkLog
//
//  Created by Khanh T Pham on 10/28/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    
    @IBOutlet weak var workTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension WorkViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workTableView.dequeueReusableCell(withIdentifier: "Work Cell", for: indexPath) as! WorkTableViewCell
        
        cell.title.text = "Job number 1"
        cell.totalTime.text = "10:00:00"
        cell.frame.size.height = CGFloat(100)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Timer Segue", sender: nil)
    }
    
}

