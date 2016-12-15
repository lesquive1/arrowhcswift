//
//  TestTableViewCell.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-14.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var testDate: UILabel!
    @IBOutlet weak var testBlood: UILabel!
    @IBOutlet weak var testCholesterol: UILabel!
    @IBOutlet weak var testHeart: UILabel!
    @IBOutlet weak var testTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
