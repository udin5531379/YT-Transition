//
//  Miniplayer.swift
//  YT Mini Player Transition
//
//  Created by Udin Rajkarnikar on 1/17/21.
//

import SwiftUI

struct Miniplayer: View {
    @State var globalHeight : CGFloat = 0
    @EnvironmentObject var player : VideoPlayerViewModel
    var body: some View {
            VStack{
                VStack {
                    VideoPlayerView()
                        .frame(width: player.isMiniPlayerOpen ? 150 :  player.videoWidth ,height: player.isMiniPlayerOpen ? 70 : getFrame())
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                GeometryReader{ reader in
                    
                    ScrollView  {
                        VStack(spacing: 18) {
                            //video playback details and buttons(like, save, share etc...)
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text("Why everyone should visit nepal...")
                                    .font(.callout)
                                
                                Text("1.2M views")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }).frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 15)
                                                        
                            //Buttons
                            
                            HStack{
                                LikeDislikeShareSaveButtons(image: "hand.thumbsup", text: "256k")
                                LikeDislikeShareSaveButtons(image: "hand.thumbsdown", text: "2k")
                                LikeDislikeShareSaveButtons(image: "square.and.arrow.up", text: "Share")
                                LikeDislikeShareSaveButtons(image: "square.and.arrow.down.fill", text: "Download")
                                LikeDislikeShareSaveButtons(image: "bookmark", text: "Save")
                            }
                            Divider()
                            
                            VStack(spacing: 15) {
                                    ForEach(videos) { video in
                                        VideoCard(video: video)
                                        
                                    }
                                }
                            
                        }
                    }.onAppear(perform: {
                        //screen ko height tahapauna
                        globalHeight = reader.frame(in: .global).height
                        player.height =  globalHeight + 250
                    })
                    
                }.background(Color.white)
                .opacity(player.isMiniPlayerOpen ? 0 : getOpacity())
                .frame(height: player.isMiniPlayerOpen ? 0 : nil)
            }
            .background(
                Color.white
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onTapGesture {
                        withAnimation(.default){
                            player.videoWidth = UIScreen.main.bounds.width
                            player.height = 250
                            player.isMiniPlayerOpen.toggle()
                            
                        }
                    }
            )
    }
    
    func getFrame() -> CGFloat{
        
        let progress = player.offset / (player.height - 100)
        
        if (1 - progress) <= 1.0 {
            
            let videoHeight : CGFloat = (1 - progress) * 250
            
            //player height stopping at 70
            if videoHeight <= 70 {
                let percent = videoHeight / 70
                let videoWidth : CGFloat = percent * UIScreen.main.bounds.width
                
                DispatchQueue.main.async {
                    player.videoWidth = videoWidth
                    
                    //player width stopping at 150
                    if player.videoWidth <= 150 {
                        
                        player.videoWidth = 150
                    }
                    
                }
                
                return 70
            }
            //since offset, y= 0 huda chahe hamro video ko height is 250 at that moment ani tei bela hamo videoWidth pani same as the different iphone screens
            DispatchQueue.main.async {
                player.videoWidth = UIScreen.main.bounds.width
            }
            
            return videoHeight
            
        }
        
        return 250
        
    }
    
    func getOpacity() -> Double{
        
        let progress = player.offset / (player.height - 50)
        
        if progress <= 1 {
            
            return Double(1 - progress)
            
        }
        
        return 1
    }
}

struct Miniplayer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct LikeDislikeShareSaveButtons: View {
    var image: String
    var text: String
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            VStack(spacing: 10){
                Image(systemName: image)
                
                Text(text)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
        })
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
    }
}
