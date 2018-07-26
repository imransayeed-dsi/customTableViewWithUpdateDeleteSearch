//
//  ViewController.swift
//  customCell
//
//  Created by Sebastian Hette on 23.09.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit
var car = ["Car", "Race","Win"]
var des = ["Demo description","Only for fun","This is another description dsfdsfsdfsdfdsfsdfsdfsjsdf"]
var myIndex: Int? = 0
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    //let animals = ["Panda", "Lion", "Elefant"]
    
   /* @IBAction func editModeOn(_ sender: Any) {
        let click = addViewController()
        var _: Bool
        click.fiEld1.text = car[myIndex]
        click.fiEld2.text = des[myIndex]
        click.saveButton(true as AnyObject)
    }*/
    //var c = 0
    /*@IBAction func editOn(_ sender: Any) {
        //performSegue(withIdentifier: "edit", sender: self)
        //let num: Int? = 1
         //c = 1
        //prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
        self.performSegue(withIdentifier: "edit", sender: self)
        /*let click = addViewController()
        //click.viewDidLoad.editBegin()
        let indexPath = self.tableView.indexPathForSelectedRow
        myIndex! = (indexPath?.row)!
        click.editStart(self)
        
        //click.sometHing = car
            //click.someDescription = des
        
        
        tableView.reloadData()
        //navigationController?.pushViewController(click, animated: true)*/
        
    }*/
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "edit") {
            let c: Int? = 1
            //let indexPath = self.tableView.indexPathForSelectedRow
           // myIndex! = (indexPath?.row)!
            let click = segue.destination as! addViewController
            click.isEditOn = c
            //click.fiEld1.text! = car[myIndex!]
            //click.fiEld2.text! = des[myIndex!]
            //click.sometHing.append( car[myIndex!])
            //click.someDescription[myIndex!] = des[myIndex!]
        }
        else if (segue.identifier == "addEntry") {
            let c1: Int? = 0
            let ck = segue.destination as! addViewController
            ck.isEditOn = c1
        }
    }
    
    var filteredData = [String]()
    
    var inSearchMode = false
    
    var deletePlanetIndexPath: NSIndexPath? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        self.tableView.addSubview(self.refreshControl)
        
        
    }
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        
        // Simply adding an object to the data source for this example
        //let newHotel = Hotels(name: "Montage Laguna Beach", place: "California south")
        //hotels.append(newHotel)
        
        //hotels.sort() { $0.name < $1.place }
        //addViewController.saveButton(self)
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        inSearchMode = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        inSearchMode = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        inSearchMode = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        inSearchMode = false;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            
            view.endEditing(true)
            
            self.tableView.reloadData()
            
        }else {
        filteredData = car.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filteredData.count == 0){
            inSearchMode = false;
        } else {
            inSearchMode = true;
        }
            self.tableView.reloadData()}
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if inSearchMode {
            
            return filteredData.count
        }
        //return (animals.count)
        return (car.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as? ViewControllerTableViewCell {
        let text: String!
        
        if inSearchMode {
            
            text = filteredData[indexPath.row]

        
            cell.congigureCell(text: text)
        //cell.myImage.image = UIImage(named: (animals[indexPath.row] + ".jpg"))
            cell.myImage.image = UIImage(named: (car[indexPath.row]))
        
        //cell.myLabel.text = animals[indexPath.row]
            //cell?.myLabel.text = car[indexPath.row]
            cell.myLabel2.text = "Available"
            //cell.myLabel3.text = "Beautiful"
            cell.myLabel3.text = des[indexPath.row]
            
        }
        else {
                text = car[indexPath.row]
            cell.congigureCell(text: text)
            //cell.myImage.image = UIImage(named: (animals[indexPath.row] + ".jpg"))
            cell.myImage.image = UIImage(named: (car[indexPath.row]))
            
            //cell.myLabel.text = animals[indexPath.row]
            //cell?.myLabel.text = car[indexPath.row]
            cell.myLabel2.text = "Available"
            //cell.myLabel3.text = "Beautiful"
            cell.myLabel3.text = des[indexPath.row]
            
            }
            return (cell)
        }else {
            return UITableViewCell()
        }
    }
        
    
    
        
    
    /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            
        } else {
            
            inSearchMode = true
            
            filteredData = car.filter({$0 == searchBar.text})
    
            tableView.reloadData()
        }
    }*/
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segoui", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletePlanetIndexPath = indexPath as NSIndexPath
            let planetToDelete = car[indexPath.row]
            confirmDelete(planet: planetToDelete)
        }
            }
    
    // Delete Confirmation and Handling
    func confirmDelete(planet: String) {
        let alert = UIAlertController(title: "Delete Planet", message: "Are you sure you want to permanently delete \(planet)?", preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: handleDeletePlanet)
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelDeletePlanet)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support presentation in iPad
        alert.popoverPresentationController?.sourceView = self.view
        //alert.popoverPresentationController?.sourceRect = CGRect(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleDeletePlanet(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deletePlanetIndexPath {
            tableView.beginUpdates()
            car.remove(at: indexPath.row)
            //car.removeAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            
            deletePlanetIndexPath = nil
            
            tableView.endUpdates()
        }
    }
    
    func cancelDeletePlanet(alertAction: UIAlertAction!) {
        deletePlanetIndexPath = nil
    }



}

