//
//  PatientTableViewController.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-14.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit


class PatientTableViewController: UITableViewController {
    
    
    var patients = [Patient]()
    
    var doctorId: String = ""
    
    func loadPatients() {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
       // print(doctorId)
        let request = NSMutableURLRequest(URL: NSURL(string: "https://arrowhc.herokuapp.com/doctorpatients/"+doctorId)!)
        request.HTTPMethod = "GET";
        
        session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
                if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
                    //completion(success: true, object: json)
                    
                    for var i = 0; i < json?.count; i++ {
                        if let item = json![i] {
                            //print(item)
                            
                            let id = item["_id"] as? String
                            let patient_name = item["patient_name"] as? String
                            let room_no = item["room_no"] as? String
                            let username = item["username"] as? String
                            let password = item["password"] as? String
                            let doc_id = item["doc_id"] as? String
                            let doc_name = item["doc_name"] as? String
                            let doc_username = item["doc_username"] as? String
                            let department = item["department"] as? String
                            let nurse_id = item["nurse_id"] as? String
                            let nurse_name = item["nurse_name"] as? String
                            let nurse_username = item["nurse_username"] as? String
                            
                            
                            let patient = Patient(id: id!,
                                                  patient_name: patient_name!,
                                                  room_no: room_no!,
                                                  username: username!,
                                                  password: password!,
                                                  doc_id: doc_id!,
                                                  doc_name: doc_name!,
                                                  doc_username: doc_username!,
                                                  department: department!,
                                                  nurse_id: nurse_id!,
                                                  nurse_name: nurse_name!,
                                                  nurse_username: nurse_username!)!
                            
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                
                                self.patients.append(patient)
                                
                                self.tableView.reloadData()
                                
                            }
                        }
                    }
                    /*
                     
                     
                     if let email = item["email"] as? String {
                     print(email)
                     dispatch_async(dispatch_get_main_queue()) {
                     self.labelTest.text = email
                     }
                     */
                    
                } else {
                    //completion(success: false, object: json)
                }
            }
            }.resume()
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadPatients()
        
        print(doctorId)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return patients.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PatientTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PatientTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let patient = patients[indexPath.row]
        
        cell.patientName.text = patient.patient_name
        cell.patientDepartment.text = patient.department
        cell.patientRoom.text = patient.room_no
        
        return cell
        
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        if segue.identifier == "showTests" {
            let testTableViewController = segue.destinationViewController as! TestTableViewController
            //let testTableViewController = nav.topViewController as! TestTableViewController
            
            
            // Get the cell that generated this segue.
            if let selectedPatientCell = sender as? PatientTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedPatientCell)!
                let selectedPatient = patients[indexPath.row]
                testTableViewController.patientId = selectedPatient.id
            }
        }
        else if segue.identifier == "addPAtient" {
            print("Adding new patient.")
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func unwindToPatientList(sender: UIStoryboardSegue) {
        
        patients = [Patient]()
        
        loadPatients()
        
        
    }

}
