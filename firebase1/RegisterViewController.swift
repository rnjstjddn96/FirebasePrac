//
//  RegisterViewController.swift
//  firebase1
//
//  Created by 권성우 on 2020/06/12.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnRegi: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnRegi(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { authResult, error in
            if authResult != nil{
                print("Register success")
                self.dismiss(animated: true)
        
            }else{
                print("Register failed")
                /*let registerAlert = UIAlertController(title: "Register", message: "회원가입 실패", preferredStyle: UIAlertController.Style.actionSheet)
                let okAction = UIAlertAction(title: nil, style: .destructive, handler: nil)
                registerAlert.addAction(okAction)
                self.present(registerAlert, animated: true,completion:  nil)*/
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
