//
//  ViewController.swift
//  ExampleWithAlamo
//
//  Created by Weerawat Pleanchum on 29/9/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON
import SVProgressHUD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       loadData()
    }
    func loadData(){
        let URL = "https://nuuneoi.com/courses/500px/list"
        Alamofire.request(URL).responseObject{ (response: DataResponse<PhotoResponse>) in
            
            let weatherResponse = response.result.value
            print(weatherResponse?.data)
            
            if let data = weatherResponse?.data {
                for newdata in data {
                    print(newdata.iso)
                    
                }
            }
        }
    }


}

