//
//  LoginViewController.swift
//  OpenWeatherAPI
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipcode:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipcode.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let VC = segue.destination as? loadViewController else {return}
        if let zip = Int(zipcode.text ?? "") {
            VC.zip = zip
        }
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField.text?.count == 5) {
            zipcode.resignFirstResponder()
            performSegue(withIdentifier: "load", sender: self)
        }
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if allowedCharacters.isSuperset(of: characterSet) {
        
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 5
        }
        return false
    }
    

}
