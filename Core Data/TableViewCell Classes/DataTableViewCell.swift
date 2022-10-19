//
//  DataTableViewCell.swift
//  Core Data
//
//  Created by Shahzaib on 10/23/21.
//  Copyright © 2021 Shahzaib. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    // MARK:- Creating Outlets.
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dname: UILabel!
    @IBOutlet weak var daddress: UILabel!
    @IBOutlet weak var dcity: UILabel!
    @IBOutlet weak var dmobile: UILabel!
    
    // MARK:- View life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.borderColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 5
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
