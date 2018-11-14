//
//  File Name. : ListViewController.swift
//  Assignment : InClass03
//  Student Full Name : Pranalee Jadhav
//  ListViewController.swift
//  InClass03
//
//  Created by Pranalee Jadhav on 10/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tableArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        tableView.tableFooterView = UIView()
        tableArr = Array(AppsData.data.keys)
        tableView.separatorColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

    // MARK: - TableView Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellItem")!
        
        cell.textLabel?.text = tableArr[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
                let i = tableView.indexPath(for: cell)!.row
                let vc = segue.destination as! AppListViewController
                vc.tableArr = AppsData.data[tableArr[i]]
            }
       
    }

    


}
