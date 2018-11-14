//
//  File Name. : AppListViewController.swift
//  Assignment : InClass03
//  Student Full Name : Pranalee Jadhav
//  Created by Pranalee Jadhav on 10/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var releaseLb: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var appImg: UIImageView!
}

class AppListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let dateFormatter = DateFormatter()
    var tableArr: [(title: String, developer: String, imgSmall: String, imgLarge: String, releaseDate: String, price: String)]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
        tableView.tableFooterView = UIView()
        
    }
    
    // MARK: - TableView Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellItem") as!  AppTableViewCell  //1.
        cell.appTitleLabel.text = tableArr[indexPath.row].title
        cell.appTitleLabel.adjustsFontSizeToFitWidth = true
        
        cell.developerLabel.text = tableArr[indexPath.row].developer
        cell.cost.text =  tableArr[indexPath.row].price
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-SS:SS"
        let date = dateFormatter.date(from: tableArr[indexPath.row].releaseDate)! // "2017-01-27T18:36.326Z"
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let dateString = dateFormatter.string(from: date)
        
        
        cell.releaseLb.text = dateString
        let url = URL(string: tableArr[indexPath.row].imgSmall)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.appImg.image = UIImage(data: data!)
            }
        }

        //cell.appImg.sd_setImage(with: URL(string: tableArr[indexPath.row].imgSmall), placeholderImage: UIImage(named: "placeholder.png"))
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let i = tableView.indexPath(for: cell)!.row
            let vc = segue.destination as! AppDetailsViewController
            vc.dict = tableArr[i]
        }
        
    }
    
    
}
