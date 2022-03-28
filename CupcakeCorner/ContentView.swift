//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

class User: ObservableObject, Codable{
    //must tell swift what properties must be loaded and saved
    //tells to save the name property
    enum CodingKeys: CodingKey{
        case name
    }
    @Published var name = "Tide Poole"
    //general Decoder contains all of our data; up to us on how to read it
    //'required' means anyone sublclassing User class must override init with custom data (can make it a 'final class' as well)
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //looks for String in '.name' in our CodingKeys
        name = try container.decode(String.self, forKey: .name)
    }
    //for writing out the data
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
