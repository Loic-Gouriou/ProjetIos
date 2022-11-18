//
//  TableViewController.swift
//  ProjetFitHelp
//
//  Created by Loïc GOURIOU on 16/11/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ExercicesViewController: UIViewController {
    
    
    var exs: [String] = []
    var Post: [Exercices] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var buttondeco: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        initExercice()
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    func initExercice() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        var url = URL(string: "https://wger.de/api/v2/exercise/?format=json&limit=386&language=2")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                } else {
                    if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                        if let data = json as? [String: AnyObject] {
                            if let items = data["results"] as? [[String: AnyObject]] {
                                for item in items {
                                    self.exs.append(item["name"]! as! String)
                                }
                            }
                        }
                    }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        task.resume()

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


extension ExercicesViewController: UITableViewDelegate {
    
    func tableView(_  tableView: UITableView, didSelectRowAt indexPath: IndexPath){
          if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
         
              vc.exerciceName = exs[indexPath.row]
         self.navigationController?.pushViewController(vc, animated: true)
         }
         
         
         
         }
    }


extension ExercicesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let nbElement = exs.count
        for i in 0...nbElement{
            cell.textLabel?.text = exs[indexPath.row]
            return cell
        }
        return cell
    }
}




struct Exercices {
    let name: String
    let commentaire: String
}


extension Exercices {
    init?(json: [String: AnyObject]) {
        guard
              let name = json["name"] as? String,
              let commentaire = json["commentaire"] as? String
        else {
            return nil
        }

        self.name = name
        self.commentaire = commentaire
    }
}



