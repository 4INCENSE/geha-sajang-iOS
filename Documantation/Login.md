# 로그인 화면

## 고민한 점 / 고려한 점

게하사장의 유저는 호스트와 스탭임. 로그인 시 호스트인지 스탭인지 고르게 하기 위해서 UI 중 action sheets를 사용.

> An action sheet is a specific style of alert that appears in response to a control or action, and presents a set of two or more choices related to the current context. Use an action sheet **to let people initiate tasks**, or to request confirmation before performing a potentially destructive operation. 

로그인 기능을 사용하기 전에 어떤 유형의 사용자인지 선택하는 행위이므로 HIG의 내용 중 사용자가 무엇인가를 시작하도록 할 때 액션 시트를 사용한다고 하여 사용함. 

출처: [HIG - ActionSheets](https://developer.apple.com/design/human-interface-guidelines/ios/views/action-sheets/)



## 공부해야하는 부분

```swift
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
```



여기서 `AVPlayer`, `NotificationCenter`, `frame&bound`, `Action Sheet`

공부하기

### AVPlayer
[AVPlayerlooper](https://developer.apple.com/documentation/avfoundation/avplayerlooper) 이것도 있었는데 사용하지 않음. 이유는 여러개의 플레이 리스트가 있을 때 그 플레이 리스트를 돌면서 반복하게 만들어주는 것 같음. 현재에는 영상 재생이 끝났을 때 노티피케이션을 보내서 다시 재생하는 방법인데 두 개의 차이점은 비교해봐야 할 것 같음.

### 참고한 링크

#### AVPlayer
**영상 재생이 끝났을 때 다시 재생하는 기능**
[how-to-detect-when-avplayer-video-ends-playing](https://stackoverflow.com/questions/29386531/how-to-detect-when-avplayer-video-ends-playing)
[how-do-i-make-a-looping-video-in-swift](https://stackoverflow.com/questions/34990060/how-do-i-make-a-looping-video-in-swift)

#### ActionSheet 구현
[action-sheet-ios-tutorial](https://www.ioscreator.com/tutorials/action-sheet-ios-tutorial)
