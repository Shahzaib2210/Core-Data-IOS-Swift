//
//  DatabaseHelper.swift
//  Core Data
//
//  Created by Shahzaib on 10/23/21.
//  Copyright © 2021 Shahzaib. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@available(iOS 13.0, *)
class DatabaseHelper
{
    static var shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    // Mark:- Save Data Method.
    
    func save(object:[String:String])
    {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do
        {
            try context?.save()
            print("Data Save Successfully")
        }
        catch
        {
            print("Error While Saving Data")
        }
    }
    
    // Mark:- Get Data Method.
    
    func getStudentData() -> [Student] {
        
        var student = [Student]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do
        {
            student = try context?.fetch(fetchRequest) as! [Student]
            print("Data Displayed Successfully")
        }
        catch
        {
            print("Cannot Get Data")
        }
        return student
    }
    
    // Mark:- Delete Data Method.
    
    func deleteStudentdata(index: Int) -> [Student]
    {
        var allstudentd = self.getStudentData()
        context?.delete(allstudentd[index])
        allstudentd.remove(at: index)
        do {
            try context?.save()
        }
        catch {
            //print("delete in task data :- \(err.localizedDescription)")
            print("Cannot Get Data")
        }
        return allstudentd
    }
    
    // Mark:- Update Data Method.
    
    func EditData(object:[String:String], index: Int)
    {
//        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        let student = self.getStudentData()
        
        student[index].name = object["name"]
        student[index].address = object["address"]
        student[index].city = object["city"]
        student[index].mobile = object["mobile"]
        
        do
        {
            try context?.save()
            print("Data Updated Successfully")
        }
        catch
        {
            print("Error While Updating Data")
        }
    }
}
