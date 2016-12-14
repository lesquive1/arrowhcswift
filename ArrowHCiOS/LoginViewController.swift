//
//  LoginViewController.swift
//  ArrowHCiOS
//
//  Created by Harpreet Singh on 2016-12-13.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    var personID="",profile="",personName="",personUName="",personPWD=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(sender: AnyObject) {
        
        
        
        do {
            
            let data = NSData(contentsOfURL: NSURL(string: "https://arrowhc.herokuapp.com/profile")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            //      let NumberOfPersons = jsonResult.count
            
            //  **LOOP THROUGH THE JSON ARRAY**
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                personID = anItem["_id"] as! String
                profile = anItem["profile"] as! String
                personName = anItem["name"] as! String
                personUName = anItem["username"] as! String
                personPWD = anItem["password"] as! String
                
                var userT=userTF.text
                var pswdT=passwordTF.text
                // do something with personName and personID
                //  print(personName)
                // print(personID)
                if(personUName==userT && personPWD==pswdT)
                {
                    if(profile=="doctor"){
                        
                         let  storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                         
                         let vc:PatientTableViewController=storyboard.instantiateViewControllerWithIdentifier("navStaffView") as! PatientTableViewController
                         // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                         
                         self.presentViewController(vc, animated: false, completion: nil)
                        
                        
                        /*
                        let alert=UIAlertController(title: "Profile", message: "User is", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title:  personUName, style: UIAlertActionStyle.Default, handler:nil))
                        self.presentViewController(alert,animated:true,completion:nil)
                        */
                    }
                    
                }
                else
                {
                    /*
                     let alert=UIAlertController(title: "", message: "Sorry! Wrong password!", preferredStyle: UIAlertControllerStyle.Alert)
                     alert.addAction(UIAlertAction(title:  personUName, style: UIAlertActionStyle.Default, handler:nil))
                     self.presentViewController(alert,animated:true,completion:nil)
                     */
                }
                
                
            }
            
        } catch let error as NSError {
            
            print(error)
            
        }
        
        
        
    }

}
