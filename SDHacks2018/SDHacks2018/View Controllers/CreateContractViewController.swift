//
//  CreateContractViewController.swift
//  SDHacks2018
//
//  Created by Sakura Rapolu on 10/13/18.
//  Copyright © 2018 SDHacks. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CreateContractViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var createContractButton: UIButton!
    
    @IBAction func createContractButtonPressed(_ sender: Any) {
        print("create contract button pressed")
        self.performSegue(withIdentifier: "showContractDetails", sender: self)
    }
}


