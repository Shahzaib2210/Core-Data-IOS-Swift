//
//  ViewController.swift
//  Core Data
//
//  Created by Shahzaib on 10/23/21.
//  Copyright © 2021 Shahzaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //************************************************//
    // MARK:- Creating Outlets.
    //************************************************//
    
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtmobile: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    //************************************************//
    // MARK: Creating properties.
    //************************************************//
    
    var student = [Student]()
    
    var i = Int()
    var isEdit = Bool()
    
    //************************************************//
    // MARK:- View life Cycle
    //************************************************//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = true
        student = DatabaseHelper.shareInstance.getStudentData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    //************************************************//
    // MARK:- Custom methods, actions and selectors.
    //************************************************//
    
    @IBAction func BTn_Save_Data(_ sender: Any)
    {
        
        let dataRequest = ["name": txtname.text,
                           "address": txtaddress.text,
                           "city": txtcity.text,
                           "mobile": txtmobile.text ]
        
        DatabaseHelper.shareInstance.save(object: dataRequest as! [String:String])
        
        tableView.reloadData()
        tableView.isHidden = true
        
        txtname.text = ""
        txtaddress.text = ""
        txtcity.text = ""
        txtmobile.text = ""
        
        if isEdit == true
        {
            DatabaseHelper.shareInstance.EditData(object: dataRequest as! [String:String], index: i)
        }
        else{
            DatabaseHelper.shareInstance.save(object: dataRequest as! [String:String])
        }
        
        print("Save Data Clicked!")
    }
    
    //************************************************//
    
    @IBAction func Btn_Display_Data(_ sender: Any) {
        
        tableView.reloadData()
        tableView.isHidden = false
        
        print("Display Data Clicked!")
    }
    
    //************************************************//
}

extension ViewController: UITableViewDelegate,UITableViewDataSource
{
    //************************************************//
    // MARK:- UITableview delegate and datesource
    //************************************************//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    //************************************************//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return student.count
    }
    
    //************************************************//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DataTableViewCell
        
        cell.dname.text = "Name: \(student[indexPath.row].name!)"
        cell.daddress.text = "Address: \(student[indexPath.row].address!)"
        cell.dcity.text = "City: \(student[indexPath.row].city!)"
        cell.dmobile.text = "Mobile No: \(student[indexPath.row].mobile!)"
        
        return cell
    }
    
    //************************************************//
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //************************************************//
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            student = DatabaseHelper.shareInstance.deleteStudentdata(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            txtname.text = ""
            txtaddress.text = ""
            txtcity.text = ""
            txtmobile.text = ""
        }
    }
    
    //************************************************//
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        txtname.text = student[indexPath.row].name!
        txtaddress.text = student[indexPath.row].address!
        txtcity.text = student[indexPath.row].city!
        txtmobile.text = student[indexPath.row].mobile!
        
        i = indexPath.row
        isEdit = true
    }
    
    //************************************************//
}


