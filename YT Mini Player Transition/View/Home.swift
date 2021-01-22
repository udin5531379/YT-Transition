//
//  Home.swift
//  YT Mini Player Transition
//
//  Created by Udin Rajkarnikar on 1/17/21.
//

import SwiftUI

struct Home: View {
    @StateObject var player = VideoPlayerViewModel()
    
    //to avoid gesture gliches we use gesture state
    @GestureState var gestureOffset : CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(videos) { video in
                        VideoCard(video: video)
                            .onTapGesture {
                                withAnimation {
                                    player.isShowingPlayer.toggle()
                                }
                            }
                    }
                }
            }
            
            //Video Player view
            if player.isShowingPlayer {
                
                Miniplayer()
                //Move from bottom to up
                    .transition(.move(edge: .bottom))
                    .offset(y: player.offset)
                    .gesture(DragGesture().updating($gestureOffset, body: { (value, state, _) in
                        state = value.translation.height
                    })
                        .onEnded(onEnd(value:)))
            }
        }
        .onChange(of: gestureOffset, perform: { value in
            onChanged()
        })
        .environmentObject(player)
        
    }
    
    func onChanged(){
        //since offset ko value for y is 0 hamiley jati drag garyo tyeti nai huncha height yp function ley
            print("gesture offset", gestureOffset)
            player.offset = gestureOffset
     }
    
    func onEnd(value: DragGesture.Value){
        //but yo function ley chahe jati drag garey pani tei original y offset that is 0 ma lyaucha with bouncing effect
        withAnimation(.default){
            if !player.isMiniPlayerOpen { //this codes executes when it is false
                
                player.offset = 0
                
                if value.translation.height > UIScreen.main.bounds.height / 3 {
                    print("value.translation.height", value.translation.height)
                    print("UIScreen", UIScreen.main.bounds.height/3)
                    player.isMiniPlayerOpen = true
                } else {
                    player.isMiniPlayerOpen = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
