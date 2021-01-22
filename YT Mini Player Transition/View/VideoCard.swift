//
//  VideoCard.swift
//  YT Mini Player Transition
//
//  Created by Udin Rajkarnikar on 1/17/21.
//

import SwiftUI

struct VideoCard: View {
    var video: Video
    var body: some View {
        VStack(spacing: 10){
            Image(video.image)
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            
            HStack(spacing: 15){
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, content: {
                    Text(video.title)
                        .fontWeight(.semibold)
                        .font(.callout)
                    
                    HStack{
                        Text("Udin Rajkarnikar")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Text(". 10K Views")
                            .font(.caption)
                        
                        Text(". 5 days ago")
                            .font(.caption)
                        
                    }.foregroundColor(.gray)
                    .padding(.top, 2)
                    
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.vertical, 5)
        }
        .padding(.horizontal)
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
