//
//  WorkTableViewCell.swift
//  WorkLog
//
//  Created by Khanh T Pham on 10/28/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var totalTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frame.size.height = CGFloat(100)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
