//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //3 phases when loading an image and can do something for each one
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")){ phase in
            //image is loaded
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            //error laoding the image
            } else if phase.error != nil{
                Text("There was an error loading the image")
            //image is still loading
            } else{
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
