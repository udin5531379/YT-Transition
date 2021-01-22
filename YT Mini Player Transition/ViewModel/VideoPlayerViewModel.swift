//
//  VideoPlayerViewModel.swift
//  YT Mini Player Transition
//
//  Created by Udin Rajkarnikar on 1/20/21.
//

import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    
    //Miniplayer Properties
    @Published var isShowingPlayer = false
    
    //gesture offset
    @Published var offset: CGFloat = 0
    @Published var isMiniPlayerOpen = false
    @Published var height : CGFloat = 0
    @Published var videoWidth : CGFloat = UIScreen.main.bounds.width
}
