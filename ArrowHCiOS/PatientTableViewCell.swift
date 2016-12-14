//
//  PatientTableViewCell.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-14.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class PatientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientDepartment: UILabel!
    @IBOutlet weak var patientRoom: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
