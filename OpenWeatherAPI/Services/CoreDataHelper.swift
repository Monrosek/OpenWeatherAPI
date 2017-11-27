//
//  CoreDataHelper.swift
//  OpenWeatherAPI
//
//  Created by Mac on 11/27/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit
import CoreData

class CData {
    
    class func SaveZipCode(_ zip:Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Location", in: managedContext) else {return}
        let data = NSManagedObject(entity: entity, insertInto: managedContext)
        data.setValue(zip, forKey: "postal")
        
        do {
            try managedContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
