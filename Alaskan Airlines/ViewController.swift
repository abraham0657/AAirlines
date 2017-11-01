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
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        if airportTextField.text?.count != 3 {
            // error
        } else if minBeforeTextField.text!.isEmpty || minAfterTextField.text!.isEmpty {
            // error
        } else {
            // conduct search
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == airportTextField {
            if string != "" && airportTextField.text!.count >= 3 {
                return false
            } else {
                airportTextField.text = (textField.text! as NSString).replacingCharacters(in: range, with: string.uppercased())
                return false    // returning since we already updated textfield
            }
        }
        
        return true
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let skyTxtField = textField as! SkyFloatingLabelTextField
        skyTxtField.errorMessage = (textField.text?.isEmpty)! ? "Invalid Input" : nil
    }
}
