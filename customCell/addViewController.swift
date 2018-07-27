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
    var sometHing = [String]()
    var someDescription = [String]()
    //var sometHing: String = ""
    //var someDescription: String = ""
    //@IBOutlet weak var fiEld2: UITextField!
    @IBOutlet weak var textViewField: UITextView!
    
    var isEditOn: Int?
   // func editStart(_ sender: Any){
   //     sometHing[myIndex!] = car [myIndex!]
   //     someDescription[myIndex!] = des[myIndex!]
   // }
   /* public func editBegin( num: Int?) -> Int? {
        //isEditOn = num
        //_ = num
        //print(isEditOn!)
        //print(isEditOn!,"ok")
        return num!
    }*/
    
    /*@IBAction func editBegin(_ sender: Any) {
        isEditOn = true
        fiEld1.text = car[myIndex]
        fiEld2.text = des[myIndex]
    }*/
    
    /*@IBAction func editBegin(_ sender: Any) {
        isEditOn = true
        fiEld1.text = car[myIndex]
        fiEld2.text = des[myIndex]*/
    
    /*@IBAction func editBegin(_ sender: Any, forEvent event: UIEvent) {
        isEditOn = true
        fiEld1.text = car[myIndex]
        fiEld2.text = des[myIndex]
    }*/
    //func editBegin(_ sender: AnyObject) {
      //  fiEld1.text! = car[myIndex!]
     //   fiEld2.text! = des[myIndex!]
    //}
    override func viewDidLoad() {
        super.viewDidLoad()
        //textViewField.frame(forDictationResultPlaceholder: "enter description")
        //textViewField?.placeholder
        if isEditOn == 1 {
        fiEld1!.text = car[myIndex!]
            textViewField!.text = des[myIndex!]
            
        }
        
        //fiEld1!.text = sometHing[myIndex!]
            //fiEld2.text! = someDescription[myIndex!]
            
        
        
    }
    @IBAction func saveButton(_ sender: AnyObject) {
            if isEditOn == 1{
            car[myIndex!] = fiEld1.text!
            des[myIndex!] = textViewField.text!}
            else {
                car.append(fiEld1.text!)
                des.append(textViewField.text!)
                print(car) }
        
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
