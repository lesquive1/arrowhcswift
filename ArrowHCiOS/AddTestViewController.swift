//
//  AddTestViewController.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-15.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class AddTestViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

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

        navigationController!.popViewControllerAnimated(true)

    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://arrowhc.herokuapp.com/test")!)
        request.HTTPMethod = "POST";
        
        let mDate = NSDate()
        
        let jsonDict = ["patient_name": "Teresa",
                        "patient_id": "584f6d711d9dac000451c334",
                        "blood_presure": "test",
                        "cholesterol": "test",
                        "heart_rate": "test",
                        "temperature": "test",
                        "date": String(mDate)] as Dictionary<String, String>
        
        // + "Dec 12, 2016 10:46:17 PM"
        
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
