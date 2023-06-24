//
//  ContentView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                VStack {
//                    FormView()
//                    AddMomentView(width: geo.size.width, height: geo.size.height)
                    HomeView(width: geo.size.width, height: geo.size.height)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
