//
//  DetailViewController.swift
//  ExampleWithAlamo
//
//  Created by Weerawat Pleanchum on 30/9/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit
import AlamofireImage
import SVProgressHUD
import Alamofire

class DetailViewController: UIViewController {
   
    
    @IBOutlet weak var imagedetail: UIImageView!
    var photoDetail:Data?
    override func viewDidLoad() {
        super.viewDidLoad()

//        imagedetail.image = photoDetail?.imageURL
        Alamofire.request((photoDetail?.imageURL)!).responseImage { response in
            if let image = response.result.value{
                self.imagedetail.image = image
            }
            
            
        }
    }
    

    

}
