//
//  ViewController.swift
//  Alaskan Airlines
//
//  Created by Abraham Tesfamariam on 10/31/17.
//  Copyright © 2017 RJT Compuquest. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    @IBOutlet weak var airportTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var minBeforeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var minAfterTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

