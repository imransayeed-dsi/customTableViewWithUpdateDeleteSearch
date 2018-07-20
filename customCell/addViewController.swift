//
//  addViewController.swift
//  customCell
//
//  Created by User on 19/7/18.
//  Copyright © 2018 MAGNUMIUM. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    @IBOutlet weak var fiEld1: UITextField!
    
    @IBOutlet weak var fiEld2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveButton(_ sender: AnyObject) {
        car.append(fiEld1.text!)
        des.append(fiEld2.text!)
        print(car)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
