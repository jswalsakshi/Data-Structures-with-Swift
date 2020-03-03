//
//  DataBaseHelper.swift
//  CodaData Project
//
//  Created by Sakshi Jaiswal on 03/03/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataBaseHelper {
    
    static var shareInstance = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: [String: String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do{
            try context?.save()
        } catch{
            print("Data is not Save")
        }
    }
}
