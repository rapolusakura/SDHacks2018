//
//  ContractDetailsViewController.swift
//  SDHacks2018
//
//  Created by Sakura Rapolu on 10/13/18.
//  Copyright © 2018 SDHacks. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ContractDetailsViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let apiToContact = "https://account-d.docusign.com/oauth/userinfo"
        
        guard let url = URL(string: apiToContact) else {return assertionFailure("URL Failed")}
        
        var request = URLRequest(url: url)
        request.setValue("Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQkAAAABAAUABwCAYT9FIDHWSAgAgKFiU2Mx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4EgABAAAACwAAAGludGVyYWN0aXZlMACANA5EIDHWSA.qAhB6vcx3mqeA4Se-UfaVAQiRaoX_C48eYs59B879dPCXQerO9__EURHuFCXc1cRtCgYdKkCZcRIUloVWAtewUv2Juu0VKZRK2X0JKKPEiGaPpL1xpxkVOb6ncTiWaN9U-qZjgyLQHsqIitWJn2x3YpGiOsf1Y1D3USjVfiHT7bqFCTVOv3AHqtdMX28SXRE3OZ8f3T7VKPnaPOzgwr-SuCigGHLIFN_aPx-7_MqOC_D1G6C2Y0W4y8UGuKwMp0iceWwuzWVWTdBjvLx8nLWSZ9eTq13GgHkeOsi9NxHCnag25I5AK4RxLt8jgwTUIx5WewcBcDaB9MvMKXAYoJYGw", forHTTPHeaderField: "Authorization")

        Alamofire.request(request).validate().responseJSON() { response in
            print(response)
            if let value = response.result.value {
                let json = JSON(value)
                self.firstNameLabel.text = json["given_name"].stringValue
                self.lastNameLabel.text = json["family_name"].stringValue
                self.emailLabel.text = json["email"].stringValue
            }
        }
        
    }
    
    
    
    
}
