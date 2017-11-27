//
//  LoginViewController.swift
//  OpenWeatherAPI
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit
import CoreData

class LoginPage: PageView, UITextFieldDelegate {
    
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
        // guard let NC = segue.destination as? UINavigationController else {return}
        // guard let VC = NC.ViewControllers.first as? RootViewController else {return}
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField.text?.count == 5) {
            zipcode.resignFirstResponder()
            if let zip = (Int(textField.text ?? "")) {
                print("\(zip)")
                //self.saveToCoreData(zip)
                //performSegue(withIdentifier: "login", sender: self)
            }
        }
        return true
    }
    
    private func saveToCoreData(_ zip:Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //        let request = NSFetchRequest<NSManagedObject>(entityName:"Location")
        //        request.predicate = NSPredicate(format: "postal == %@", zip)
        //
        //        do {
        //            let locations = try managedContext.fetch(request)
        //            if(locations.count > 0) {return}
        //        } catch let error {
        //            print(error.localizedDescription)
        //        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Location", in: managedContext) else {return}
        let data = NSManagedObject(entity: entity, insertInto: managedContext)
        data.setValue(zip, forKey: "postal")
        
        do {
            try managedContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
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

