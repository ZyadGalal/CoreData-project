//
//  CoreDataHandler.swift
//  el desoky
//
//  Created by Zyad Galal on 3/21/18.
//  Copyright © 2018 Zyad Galal. All rights reserved.
//

import UIKit
import CoreData
class CoreDataHandler: NSObject {

    private class func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    class func saveObject(name : String,descrip:String) -> Bool
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Monuments", in: context)
        let mangeObject = NSManagedObject(entity: entity!, insertInto: context)
        
        mangeObject.setValue(name, forKey: "name")
        mangeObject.setValue(descrip, forKey: "descrip")
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }
    class func fetchObject() -> [Monuments]?
    {
        let context = getContext()
        var monument : [Monuments]? = nil
        do{
            monument = try context.fetch(Monuments.fetchRequest())
            return monument
        }catch{
            return monument
        }
    }
}
