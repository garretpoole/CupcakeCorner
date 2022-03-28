//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //SwiftUI doesnt know the size of the image coming from the internet
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        //resizable() and .frame() cannot apply here to AsyncImage bc Image has yet to download
        //applies to placeholder view
        .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
