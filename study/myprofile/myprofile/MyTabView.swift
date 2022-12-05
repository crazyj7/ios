//
//  MyTabView.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView  {
            Text("Hello1")
                .fontWeight(.bold)
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            
            Text("Hello2")
                .fontWeight(.bold)
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            Text("Hello3")
                .fontWeight(.bold)
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "mic.fill")
                    Text("3번")
                }
                .tag(2)
        }
        .navigationBarTitle("My Tab")
    }
    
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
