//
//  Test.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-14.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import Foundation
import UIKit

class Test {
    
    // MARK: Properties
    
    var id: String
    
    var patient_name: String
    var patient_id: String
    var blood_presure: String
    var cholesterol: String
    var heart_rate: String
    var temperature: String
    var date: String

    // MARK: Initialization
    
    init?(id: String,
          patient_name: String,
          patient_id: String,
          blood_presure: String,
          cholesterol: String,
          heart_rate: String,
          temperature: String,
          date: String) {
        
        // Initialize stored properties.
        self.id = id
        self.patient_name = patient_name
        self.patient_id = patient_id
        self.blood_presure = blood_presure
        self.cholesterol = cholesterol
        self.heart_rate = heart_rate
        self.temperature = temperature
        self.date = date
        
        
        // Initialization should fail if there is no patient_name nor patient_id.
        if patient_name.isEmpty || patient_id.isEmpty {
            
            return nil
            
        }
        
    }
    
}