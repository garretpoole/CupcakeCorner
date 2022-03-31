//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.order.type){
                        ForEach(OrderStruct.types.indices) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.order.quantity)", value: $order.order.quantity, in: 3...20)
                }
                Section{
                    Toggle("Any special requests?", isOn: $order.order.specialRequestEnabled.animation())
                    
                    if order.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.order.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.order.addSprinkles)
                    }
                }
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
