//
//  LoginViewController.swift
//  VideoPlayInBackgroud
//
//  Created by Mickael Barthemy on 16/11/2022.
//  Copyright © 2022 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabaseSwift

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
                    
                    let ref = Database.database(url: "https://fithelp-4f16b-default-rtdb.europe-west1.firebasedatabase.app").reference()
                    let utilisateurID = Auth.auth().currentUser?.uid
                    
                    
                    
                    
                    ref.child("users").child(utilisateurID!).setValue(["utilisateur":self.utilisateurTextField.text!])
                    
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
    


}
