//
//  AddPatientViewController.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-15.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class AddPatientViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://arrowhc.herokuapp.com/patient")!)
        request.HTTPMethod = "POST";
        
        let jsonDict = ["patient_name": "Maria4",
                        "room_no": "101",
                        "username": "maria4",
                        "password": "bonita",
                        "doc_id": "583dcc7e5a034e0519757632",
                        "doc_name": "Dr Luis",
                        "doc_username": "luis",
                        "department": "Neurology",
                        "nurse_id": "583dccc05a034e0519757633",
                        "nurse_name": "Nr Laura",
                        "nurse_username": "eli",
                        "profile": "patient",
                        "name": "Maria4",
                        "email": "testprofile@hotmail.com",
                        "phone": "6478887755"] as Dictionary<String, String>
        
        let jsonToNSData = try! NSJSONSerialization.dataWithJSONObject(jsonDict, options: NSJSONWritingOptions.PrettyPrinted)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = jsonToNSData
        
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                
                let response = NSString(data: data, encoding: NSUTF8StringEncoding)
                print(response)
                
            }
        }
        task.resume()
        
        
    }


}
