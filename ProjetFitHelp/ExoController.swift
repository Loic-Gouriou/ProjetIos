//
//  ExoController.swift
//  ProjetFitHelp
//
//  Created by Mickael Barthemy on 16/11/2022.
//

import UIKit
import Firebase

class ExoController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser {
            nameLabel.text = user.email
        } else{
            fatalError("Erreur : Aucun utilisteur est connecté lors de l'affichage de l'écran d'accueil")
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
}
