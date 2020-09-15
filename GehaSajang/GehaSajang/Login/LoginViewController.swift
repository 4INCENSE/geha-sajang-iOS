//
//  ViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/06.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    let backgroundVideo = Resource(name: ResourceName.loginBackgroundVideo, fileType: ResourceType.mp4)
    private var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        playBackgroundVideo()
    }
    
    func playBackgroundVideo() {
        let path = Bundle.main.path(forResource: backgroundVideo.name , ofType: backgroundVideo.fileType)
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        player!.seek(to: CMTime.zero)
        player!.play()
        loopVideo(videoPlayer: player!)
        self.player?.isMuted = true
    }
    
    private func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(self, selector: #selector(playBackFromBeginning), name: .AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
    }
    
    @objc private func playBackFromBeginning() {
        player!.seek(to: CMTime.zero)
        player!.play()
    }
}
