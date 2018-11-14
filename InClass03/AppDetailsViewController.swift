//
//  File Name. : AppDetailsViewController.swift
//  Assignment : InClass03
//  Student Full Name : Pranalee Jadhav
//
//  Created by Pranalee Jadhav on 10/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class AppDetailsViewController: UIViewController {

    
    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var developer: UILabel!
    
    @IBOutlet weak var releaseLb: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    
    var dict: (title: String, developer: String, imgSmall: String, imgLarge: String, releaseDate: String, price: String)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        appTitle.text = dict.title
        developer.text = dict.developer
        cost.text = dict.price
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-SS:SS"
        let date = dateFormatter.date(from: dict.releaseDate)! // "2017-01-27T18:36.326Z"
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let dateString = dateFormatter.string(from: date)
        releaseLb.text = dateString
        
        let url = URL(string: dict.imgLarge)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imgView.image = UIImage(data: data!)
            }
        }

        
        //imgView.sd_setImage(with: URL(string: dict.imgLarge), placeholderImage: UIImage(named: "placeholder.png"))
        
        
        
    }
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
