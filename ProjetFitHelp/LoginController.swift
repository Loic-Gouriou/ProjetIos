//
//  LoginViewController.swift
//  VideoPlayInBackgroud
//
//  Created by Mickael Barthemy on 16/11/2022.
//  Copyright © 2022 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    @IBAction func Loginbuttonpressed(_ sender: UIButton) {
    
    
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!)
        {
            (authResult, error ) in
            if error != nil {
                print (error.debugDescription)
            }   else{
                self.performSegue(withIdentifier: "GoToHome2", sender: self)
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
