//
//  ViewController.swift
//  CodaData Project
//
//  Created by Sakshi Jaiswal on 18/02/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt_name: UITextField!
    @IBOutlet weak var txt_address: UITextField!
    @IBOutlet weak var txt_city: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSaveData(_ sender: Any) {
        let dict = ["name": txt_name.text, "address": txt_address.text, "city": txt_city.text, "mobile": txt_mobile.text]
        DataBaseHelper.shareInstance.save(object: dict as! [String : String])
    }
    
}

