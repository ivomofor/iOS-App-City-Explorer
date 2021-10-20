//
//  ContentView.swift
//  City Explorer
//
//  Created by macbook on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            MyMap(currentRegion: $locationManager.currentRegion)
            Button(action: {print(self.locationManager.goToUserLocation() )}, label: {
                LocationButtonContent()
            })
        }).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct LocationButtonContent: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
            Image(systemName: "location")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .clipped()
                .foregroundColor(.black)
                .padding()
            
        }
    }
}
