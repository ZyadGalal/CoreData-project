//
//  ViewController.swift
//  el desoky
//
//  Created by Zyad Galal on 3/21/18.
//  Copyright © 2018 Zyad Galal. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var mon : [Monuments]? = nil
    var filtered :[String]?
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func searchButton(_ sender: Any) {
        //search bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self as? UISearchBarDelegate
        present(searchController, animated: true, completion: nil)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //still searching for it
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //you can follow this example
        putData(name: "py", descrp: "pyramids")
        //fetch the data from CoreData
        mon = CoreDataHandler.fetchObject()
        //setup table view
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mon!.count
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell")
            cell?.textLabel?.text = mon![indexPath.row].name
            return cell!
        
    }
    //here you can enter the name and description of the monument
    func putData(name: String , descrp :String)
    {
        CoreDataHandler.saveObject(name: name, descrip: descrp)
    }


}

