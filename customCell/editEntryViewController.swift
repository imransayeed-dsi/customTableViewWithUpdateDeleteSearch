//
//  editEntryViewController.swift
//  customCell
//
//  Created by User on 24/7/18.
//  Copyright © 2018 MAGNUMIUM. All rights reserved.
//

import UIKit

class editEntryViewController: UIViewController {
    
    @IBOutlet weak var editCarName: UITextField!
    
    @IBOutlet weak var editDescriptionCar: UITextView!
    
    @IBAction func edittaskSaveButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editCarName.text = car[myIndex]
        editDescriptionCar.text = des[myIndex]
        // Do any additional setup after loading the view.
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
