//
//  VideoPlayerView.swift
//  YT Mini Player Transition
//
//  Created by Udin Rajkarnikar on 1/17/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        
        let bundle_url = Bundle.main.path(forResource: "n", ofType: "mp4")
        
        let video_url = URL(fileURLWithPath: bundle_url!)
        
        //player
        let player = AVPlayer(url: video_url)
        controller.player = player
        
        //hiding controls
        controller.showsPlaybackControls = true
        controller.player?.play()
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}


