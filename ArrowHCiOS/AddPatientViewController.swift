//
//  AddPatientViewController.swift
//  ArrowHCiOS
//
//  Created by Luis Esquivel on 2016-12-15.
//  Copyright © 2016 Team Arrow. All rights reserved.
//

import UIKit

class AddPatientViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    @IBOutlet weak var pname: UITextField!
    
    
    @IBOutlet weak var department: UILabel!
   
    @IBOutlet weak var roomnumber: UILabel!

    @IBOutlet weak var nursename: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    var departmnt:String = ""
    var roomn: String = ""
    var Nname: String = ""
    
    var myDatabase = [ ["Cardiology","Neurology","Common"],
                       ["315","415","215"],
                       ["Nr.laura","Nr.sagar","Nr.harry"]
    
                      ]
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
       return myDatabase.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDatabase[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myDatabase[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component)
        print(row)
        
        
        switch (component){
        case 0:
            
        departmnt=myDatabase[component][row]
            department.text = departmnt
            print(departmnt)
            
        case 1:
            roomn=myDatabase[component][row]
            roomnumber.text=roomn
            print(roomn)
            
        case 2:
            
            Nname=myDatabase[component][row]
            nursename.text=Nname
            print(Nname)
            
        default:break
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
