//
//  ContentView.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert :Bool = false
    var urlHome : String = "http://crazyj.tistory.com"
    
    // 중앙 지점.
    let center : (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x:proxy.frame(in: .local).midX,
                       y:proxy.frame(in:.local).midY)
    }

    // no use...
    @State var isNaviBarHidden : Bool = false
    
    var body: some View {
        
        GeometryReader{ geometry in
            NavigationView {
                VStack(spacing:0) {
                    Divider().opacity(0)
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
                            Text("crazyj7@gmail.com")
                                .font(.caption)
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
                                    .background(Color.red)
                                    .cornerRadius(20)
                            }
                            
                            NavigationLink(destination: {
                                MyWebView(urlToLoad: "https://crazyj.tistory.com")
                            }) {
                                Text("WebView")
                                    .fontWeight(.bold)
                                    .padding(5)
                                    .frame(width: 100)
                                    .foregroundColor(.white)
                                    .background(Color.yellow)
                                    .cornerRadius(20)
                            }
                            
                            Link(destination: URL(string: urlHome )! )
                            {
                                Text("Home")
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
                                Text("Work")
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
                    .padding(.trailing, 10)
                    
                    
                    HStack {
                        NavigationLink(destination: MyTabView()) {
                            Text("Tab")
                                .fontWeight(.bold)
                                .padding(5)
                                .frame(width: 100)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.top, 10)
                    
                    ScrollView {
                        VStack {
                            ForEach(1...10, id: \.self) {i in
                                
                                MyCard(bgcolor: Color.yellow, title: "인사말"+String(i), msg: "반갑습니다. ", icon: "person.crop.circle.fill")
                                
                            }
                            
                        }
                        .padding()
                        
                    } // scroll view
                    
                    Spacer()
                }
                .background(Color(red: 0.9, green: 0.9, blue: 1.0))
                .navigationBarTitle("", displayMode: .inline) // 이렇게 주면 제목을 없앨 수 있다.
//                .navigationBarHidden(self.isNaviBarHidden) // hidden을 주면 내비바가 다 없어짐.
                // 내비 상단에 메뉴 버튼을 추가. 이건 보이게 한다.
                .navigationBarItems(leading:
                    Button(action: {
                        print("menu click")
                    }) {
                        Image(systemName: "line.3.horizontal")
                    }
                )
                .onAppear {
                    // 여기서 내비바를 숨기려고 했는데, 이제 사용 안함.
                    // 메뉴바는 보이게 하려고 사용 안함.
                    self.isNaviBarHidden = true
                }
            }
            .edgesIgnoringSafeArea(.all)
        } //
    } //
}

	
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

