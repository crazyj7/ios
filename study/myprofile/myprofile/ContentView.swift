//
//  ContentView.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert :Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing:0) {
    //            Spacer()
                
                HStack {
                    VStack {
                        Divider().opacity(0)
                        Image("profile")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(lineWidth:3)
                                    .foregroundColor(.blue)
                            )
                            .padding(3)
                            .overlay(
                                Circle().stroke(lineWidth:3)
                                    .foregroundColor(.green)
                            )
                            .padding(3)
                            .overlay(
                                Circle().stroke(lineWidth:3)
                                    .foregroundColor(.yellow)
                            )
                        Text("Shin")
                            .fontWeight(.bold)
                    }
                    VStack ( spacing: 10 ) {

                        NavigationLink(destination: {
                            ProfileView()
                        }) {
                            Text("Profile")
                                .fontWeight(.bold)
                                .padding(5)
                                .frame(width: 100)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(20)
                        }
                        
                        Button(action: {
                            print("click!")
                            self.showAlert = true
                        }) {
                            Text("Home")
                                .fontWeight(.bold)
                                .padding(5)
                                .frame(width: 100)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("준비 중입니다."))
                        }
                    }
                }
                Spacer().frame(height: 10)
                
                ScrollView {
                    VStack {
                        ForEach(1...10, id: \.self) {_ in
                            
                            MyCard(bgcolor: Color.yellow, title: "인사말", msg: "반갑습니다. ", icon: "person.crop.circle.fill")
                            
                        }
                        
                    }
                    .padding()

                } // scroll view

                Spacer()
            }
            .background(Color.white)
//            .navigationBarTitle("Main")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
