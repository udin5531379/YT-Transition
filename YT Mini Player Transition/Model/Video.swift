//
//  Video.swift
//  YT Mini Player Transition
//
//  Created by Udin Rajkarnikar on 1/17/21.
//

import SwiftUI

struct Video: Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var title: String
    
}

var videos = [
    
    Video(image: "thumbs1", title: "Nepal is heaven"),
    Video(image: "thumbs2", title: "People of Nepal"),
    Video(image: "thumbs3", title: "Top 10 things to do in Nepal"),
    Video(image: "thumbs4", title: "What canyou buy for 1$ in Nepal?"),
    Video(image: "thumbs5", title: "Top places to hangout in Nepal"),


]
