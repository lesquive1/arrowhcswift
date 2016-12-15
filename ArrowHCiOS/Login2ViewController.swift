//
//  Login2ViewController.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-15.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class Login2ViewController: UIViewController {

    var personID="",profile="",personName="",personUName="",personPWD="",id=""
    var go:Bool=false
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var pswdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
           }

    @IBAction func goLogin(sender: UIButton) {
        
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
                print(personID)
                var userT=userTF.text
                var pswdT=pswdTF.text
                // do something with personName and personID
                //  print(personName)
                //print(personID)
                if(personUName==userT && personPWD==pswdT)
                {
                    if(profile=="doctor"){
                        
                     /*   let  storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let vc:PatientTableViewController=storyboard.instantiateViewControllerWithIdentifier("navStaffView") as! PatientTableViewController
                        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                        
                        vc.doctorId = personID
                        
                        self.presentViewController(vc, animated: false, completion: nil)
                       
                        */
                        
                        go=true
                      id=personID
                        /* let alert=UIAlertController(title: "Profile", message: "User is", preferredStyle: UIAlertControllerStyle.Alert)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(go)
        {
        let patientTableViewController = segue.destinationViewController as! PatientTableViewController
        
        patientTableViewController.doctorId = id
        }
    }
    

}
