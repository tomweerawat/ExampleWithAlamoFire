//
//  PhotoController.swift
//  ExampleWithAlamo
//
//  Created by Weerawat Pleanchum on 29/9/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import AlamofireImage
import SwiftyJSON
import SVProgressHUD
import ObjectMapper

class PhotoController: UITableViewController {
    
    @IBOutlet var tableViewLoad: UITableView!

    var respPhoto:[Data]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: "Loading...")
        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return respPhoto?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "VacationSpotCell",for: indexPath) as! PhotoCell
       
        cell.nameLabel?.text = respPhoto?[indexPath.row].username
        cell.locationNameLabel?.text = respPhoto?[indexPath.row].caption
        Alamofire.request((respPhoto?[indexPath.row].imageURL)!).responseImage { response in
            if let image = response.result.value{
                 cell.thumbnailImageView?.image = image
            }
            

        }
       SVProgressHUD.dismiss()
        return cell;
    }
  
    func loadData(){
        
        let URL = "https://nuuneoi.com/courses/500px/list"
        
        Alamofire.request(URL).responseJSON { response in
            
            let switftyJsonVar = JSON( response.result.value!)

            if let respData = switftyJsonVar["data"].arrayObject {

            self.respPhoto = Mapper<Data>().mapArray(JSONObject: respData)
                
            self.tableViewLoad.reloadData()
          
        
            }
        }
    }

}
