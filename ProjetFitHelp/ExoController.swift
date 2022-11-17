//
//  ExoController.swift
//  ProjetFitHelp
//
//  Created by Mickael Barthemy on 16/11/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ExoController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var buttondeco: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser {
            
            let ref = Database.database(url: "https://fithelp-4f16b-default-rtdb.europe-west1.firebasedatabase.app").reference()
            let utilisateurID = Auth.auth().currentUser?.uid
            
            ref.child("users").child(utilisateurID!).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                
                let utilisateur = value?["utilisateur"] as? String ?? "Pas d'utilisateur"
                
                self.nameLabel.text = utilisateur
            }
            
            
        } else {
            
            fatalError("Erreur : Aucun utilisateur ne peut etre connecté")
            
        }
    }
    
    @IBAction func deconexxionbuttonpressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Impossible de déconnecter l'utilisateur")
        }

    }
    
}
