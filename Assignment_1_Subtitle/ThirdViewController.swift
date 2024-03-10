//
//  ThirdViewController.swift
//  Assignment_1_Subtitle
//
//  Created by Deepali on 07/03/24.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var studentdata = [(1,"Deepali"),(2,"Sai"),(3,"Krishna")]
    var studentTableViewCellIdentifier = "StudentTableViewCell"
    var studentTableViewCell : StudentTableViewCell?
    var colors : [UIColor] = [.red,.blue,.yellow,.green,.orange]
    var uiNib : UINib?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentTableView.dataSource = self
         registerXIBWithTableView()
    }
    

    func registerXIBWithTableView(){
        let uiNIb = UINib(nibName: "uiNib" , bundle: nil)
        self.studentTableView.register(uiNib, forCellReuseIdentifier: "studentTableViewCellIdentifier")
    }
    

}

extension ThirdViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        studentTableViewCell = (self.studentTableView.dequeueReusableCell(withIdentifier: studentTableViewCellIdentifier, for: indexPath) as! StudentTableViewCell)
        studentTableViewCell?.textLabel?.text = "\(studentdata[indexPath.row].0)"
        studentTableViewCell?.detailTextLabel?.text = "\(studentdata[indexPath.row].1)"
        studentTableViewCell?.textLabel?.textColor = UIColor.darkText
     

        //randomColor Property
        let randomColor =  colors.randomElement() ?? .gray
         self.studentTableViewCell?.contentView.backgroundColor = randomColor

        return studentTableViewCell!
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
             studentTableView.beginUpdates()   //to start updating TableView
            studentTableView.deleteRows(at: [indexPath], with: .fade)
            self.studentdata.remove(at: indexPath.row)
             studentTableView.endUpdates()   //to end update tableView
           }
    }
    
}

