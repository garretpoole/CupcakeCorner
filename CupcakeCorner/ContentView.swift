//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

struct Response: Codable{
    var results: [Result]
}

struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId){ item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task{
            //'await' must be used for async functions
            await loadData()
        }
    }
    //downloads codable data
    func loadData() async{
        //structure for apple api
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else{
            print("Invalid URL")
            return
        }
        
        do{
            //return is a tuple with data and metadata
            let (data, _) = try await URLSession.shared.data(from: url)
            //convert data object into Response
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
        } catch{
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
