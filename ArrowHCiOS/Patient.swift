//
//  Patient.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-14.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class Patient {
    
    // MARK: Properties
    
    var id: String
    
    var patient_name: String
    var room_no: String
    var username: String
    var password: String
    
    var doc_id: String
    var doc_name: String
    var doc_username: String
    var department: String
    
    var nurse_id: String
    var nurse_name: String
    var nurse_username: String
    
    // MARK: Initialization
    
    init?(id: String,
          patient_name: String,
          room_no: String,
          username: String,
          password: String,
          doc_id: String,
          doc_name: String,
          doc_username: String,
          department: String,
          nurse_id: String,
          nurse_name: String,
          nurse_username: String) {
        
        // Initialize stored properties.
        self.id = id
        self.patient_name = patient_name
        self.room_no = room_no
        self.username = username
        self.password = password
        self.doc_id = doc_id
        self.doc_name = doc_name
        self.doc_username = doc_username
        self.department = department
        self.nurse_id = nurse_id
        self.nurse_name = nurse_name
        self.nurse_username = nurse_username
        
        
        // Initialization should fail if there is no patient_name nor username.
        if patient_name.isEmpty || username.isEmpty {
            
            return nil
            
        }
        
    }
    
}