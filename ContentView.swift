//
//  ContentView.swift
//  dateNight
//
//  Created by MAC on 2021-10-27.
//

import SwiftUI

struct ContentView: View {
    @State private var isNetflix : Bool = false
    @State private var isDisney : Bool = false
    @State private var isAmazon : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Date Movie")
                    .font(.title)
                .padding()
                .padding()
                .padding()
                
                Text("Please choose channel(s) that you have")
                Toggle(isOn: $isNetflix) {
                    Text("Netflix")
                }
                .frame(width: 300)
                Toggle(isOn: $isDisney) {
                    Text("Disney+")
                }
                .frame(width: 300)
                Toggle(isOn: $isAmazon) {
                    Text("Amazon Prime")
                }
                .frame(width: 300)
                Spacer()
                NavigationLink(destination: MoviePage())
                {
                    Text("Suprise Me!")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .toggleStyle(.switch)
            //.navigationTitle("Homepage")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}

