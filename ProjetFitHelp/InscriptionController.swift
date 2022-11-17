//
//  LoginViewController.swift
//  VideoPlayInBackgroud
//
//  Created by Mickael Barthemy on 16/11/2022.
//  Copyright © 2022 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit
import FirebaseAuth

class InscriptiobController: UIViewController {
    
    @IBOutlet weak var stackview: UIStackView!
    
    @IBOutlet weak var utilisateurTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var inscriptionbuttonpressed: UIButton!
    
    
    @IBAction func inscriptionbuttonpressed(_ sender: UIButton) {
    
    
    
        
        if utilisateurTextField.text != "" && passwordTextField.text != "" && emailTextField.text != ""
        {
            
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
                if error != nil{
                    print(error.debugDescription)
                } else{
                    print("Inscription de \(self.utilisateurTextField.text ?? "no name") réussi ✓")
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
            }
            
        }
        else{
            print ("Erreur : les champs ne sont pas complets")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
