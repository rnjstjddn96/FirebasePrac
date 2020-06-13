//
//  LoginViewController.swift
//  firebase1
//
//  Created by 권성우 on 2020/06/12.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblInfo: UILabel!
    
    @IBAction func btnLogin(_ sender: Any) {
        if let user = Auth.auth().currentUser{
            do{
                try Auth.auth().signOut()
                tfEmail.placeholder = "이메일을 입력하세요"
                tfPassword.placeholder = "비밀번호를 입력하세요"
                self.btnLogin.setTitle("Sign-In", for: .normal)
                self.lblInfo.text! = "로그인 정보가 없습니다"
                let logoutAlert = UIAlertController(title: "로그아웃", message: "로그아웃 성공", preferredStyle: UIAlertController.Style.actionSheet)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                logoutAlert.addAction(okAction)
                self.present(logoutAlert, animated: true, completion: nil)
            }catch{
                print("SignOut Error")
            }
        }else{
            Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { (user, error) in
                if user != nil{
                    let status = Auth.auth().currentUser
                    print("login success")
                    self.tfEmail.text! = ""
                    self.tfPassword.text! = ""
                    self.btnLogin.setTitle("로그아웃", for: .normal)
                    self.lblInfo.text! = status?.email as Any as! String
                    
                    let loginAlert = UIAlertController(title: "로그인", message: "\(status?.email as Any as! String)님 환영합니다", preferredStyle: UIAlertController.Style.actionSheet)
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    loginAlert.addAction(okAction)
                    self.present(loginAlert, animated: true, completion: nil)
                }
                else{
                    print("login fail")
                    let loginAlert = UIAlertController(title: "로그인", message: "로그인 실패", preferredStyle: UIAlertController.Style.actionSheet)
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    loginAlert.addAction(okAction)
                    self.present(loginAlert, animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser {
            tfEmail.placeholder! = "이미 로그인 된 상태입니다."
            tfPassword.placeholder! = "이미 로그인 된 상태입니다."
            btnLogin.setTitle("로그아웃", for: .normal)
            self.lblInfo.text! = user.email as Any as! String
        }else{
             self.lblInfo.text! = "로그인 정보가 없습니다"
        }
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
