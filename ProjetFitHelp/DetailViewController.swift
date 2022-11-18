//
//  DetailViewController.swift
//  ProjetFitHelp
//
//  Created by Loïc GOURIOU on 18/11/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    var exerciceName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = exerciceName
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
