//
//  ViewController.swift
//  Projettest
//
//  Created by Mickael Barthemy on 15/11/2022.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var signIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
        
    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "intro", ofType: "mp4") else {
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        
        player.play()
        
        videoLayer.bringSubviewToFront(signIn)
    }


}

