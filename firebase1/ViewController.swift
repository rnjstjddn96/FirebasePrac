//
//  ViewController.swift
//  firebase1
//
//  Created by 권성우 on 2020/06/12.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    var todos = [String]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel!.text = self.todos[indexPath.row]
        return cell
    }

    @IBAction func addTodo(_ sender: Any) {
        let dialog = UIAlertController(title: "새 할일 추가", message: nil, preferredStyle: .alert)
        dialog.addTextField()
        let okAction = UIAlertAction(title: "확인", style: .default) { (action : UIAlertAction) in
            if let newTodo = dialog.textFields?[0].text {
                print("입력할 할일 : \(newTodo)")
                self.todos.append(newTodo)
                self.tableView.reloadData()
                print(self.todos)
            }
            
            self.ref = Database.database().reference()
             let itemRef = self.ref.child("list")
            //child는 지정된 상대 경로에있는 위치의 주소를 가져오는 프로퍼티
             itemRef.setValue(self.todos)
            
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        dialog.addAction(okAction)
        dialog.addAction(cancelAction)
        self.show(dialog, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }


}

