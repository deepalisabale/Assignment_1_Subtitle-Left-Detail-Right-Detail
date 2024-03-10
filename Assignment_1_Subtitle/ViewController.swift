
//
//  ViewController.swift
//  Assignment1_Basic_Style
//
//  Created by Deepali on 03/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    
    var studentData = [("100","Deepali"), ("101","Krishna"), ("102","Aditya"), ("104","Sai")]
    var studentTableViewCellIdentifier = "StudentTableViewCell"
    var studentTableViewCell : StudentTableViewCell?
    var colors : [UIColor] = [.red,.blue,.yellow,.green,.orange]
    var uiNib : UINib?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerXIBWithTableView()
    }

    func initializeTableView()
    
    {
        studentTableView.dataSource = self
    }

    func registerXIBWithTableView(){
          let uiNIb = UINib(nibName: "uiNIb" , bundle: nil)
          self.studentTableView.register(uiNib, forCellReuseIdentifier: "studentTableViewCellIdentifier")
        
    }
}


extension ViewController : UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       studentData.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        studentTableViewCell = (self.studentTableView.dequeueReusableCell(withIdentifier: studentTableViewCellIdentifier, for: indexPath) as! StudentTableViewCell)
        studentTableViewCell?.textLabel?.text = "\(studentData[indexPath.row].0)"
        studentTableViewCell?.detailTextLabel?.text = "\(studentData[indexPath.row].1)"
        studentTableViewCell?.textLabel?.textColor = UIColor.darkText
        

         let randomColor =  colors.randomElement() ?? .orange
         self.studentTableViewCell?.contentView.backgroundColor = randomColor

        return studentTableViewCell!
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
             studentTableView.beginUpdates()   //to start updating TableView
            studentTableView.deleteRows(at: [indexPath], with: .fade)
            self.studentData.remove(at: indexPath.row)
             studentTableView.endUpdates()   //to end update tableView
           }
    }

}







