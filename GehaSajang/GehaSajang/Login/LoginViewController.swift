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
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "사용자 유형을 선택해 주세요", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "사장님으로 시작하기", style: .default)
        let saveAction = UIAlertAction(title: "스탭으로 시작하기", style: .default)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}

