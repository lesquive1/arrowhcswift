//
//  TestTableViewController.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-14.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {

    
    var tests = [Test]()
    
    var patientId: String = ""
    
    func loadTests() {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://arrowhc.herokuapp.com/test/"+patientId)!)
        request.HTTPMethod = "GET";
        
        print("https://arrowhc.herokuapp.com/test/"+patientId)
        
        session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
                if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
                    //completion(success: true, object: json)
                    
                    for var i = 0; i < json?.count; i++ {
                        if let item = json![i] {
                            
                            let id = item["_id"] as? String
                            let patient_name = item["patient_name"] as? String
                            let patient_id = item["patient_id"] as? String
                            let blood_presure = item["blood_presure"] as? String
                            let cholesterol = item["cholesterol"] as? String
                            let heart_rate = item["heart_rate"] as? String
                            let temperature = item["temperature"] as? String
                            let date = item["date"] as? String
                            
                            let test = Test(id: id!,
                                            patient_name: patient_name!,
                                            patient_id: patient_id!,
                                            blood_presure: blood_presure!,
                                            cholesterol: cholesterol!,
                                            heart_rate: heart_rate!,
                                            temperature: temperature!,
                                            date: date!)!
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                
                                self.tests.append(test)
                                
                                self.tableView.reloadData()
                                
                            }
                        }
                    } //for
                    
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

        loadTests()
        
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
  
        return tests.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TestTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TestTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let test = tests[indexPath.row]
        
        cell.testDate.text = test.date
        cell.testBlood.text = test.blood_presure
        cell.testCholesterol.text = test.cholesterol
        cell.testHeart.text = test.heart_rate
        cell.testTemperature.text = test.temperature
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        
    }
    */
    
    // MARK: - Actions
    
    @IBAction func unwindToTestList(sender: UIStoryboardSegue) {
        
        tests = [Test]()
        
        loadTests()
        /*
         if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
         
         // Add a new meal.
         let newIndexPath = IndexPath(row: meals.count, section: 0)
         
         meals.append(meal)
         tableView.insertRows(at: [newIndexPath], with: .automatic)
         }
         */
        
    }

}
