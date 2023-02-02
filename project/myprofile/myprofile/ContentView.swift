//
//  ContentView.swift
//  myprofile
//
//  Created by mobile on 2022/12/15.
//

import SwiftUI

func CircleImage(img : String) -> some View {
    Image(img)
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
                .foregroundColor(.red)
        )
}

func Item(date:String,  title:String, link:String) -> some View {
    NavigationLink(destination: MyWebView(urlToLoad: link)) {
        Text(date).fontWeight(.light)
            .foregroundColor(.gray)
        Text(title)
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                NavigationView {
                    VStack (spacing: 0) {
                        HStack {
                            CircleImage(img: "profile")
                            VStack(alignment: .leading) {
                                Text("Junhee Shin")
                                Text("crazyj7@gmail.com")
                                Text("#PowerLifting #Calithenics #Running")
                                Text("#AI #SoftwareDevelop")
                            }
                            
                        }
                        List {
                            Section("PowerLifting") {
                                NavigationLink(destination: Text("Squat"), label: {
                                    Text("스쿼트")
                                })
                                Text("벤치프레스")
                                Text("데드리프트")
                                Item(date: "2021-07", title: "벤치100", link: "https://photos.app.goo.gl/2xkdbuvMPm5Dv3SP6")
                                Item(date: "2018-09", title: "벤치 깔림", link: "https://photos.app.goo.gl/4gHRwE1DCGD8yiDb8")
                            }
                            Section("체조") {
                                Text("풀업")
                                Text("머슬업")
                                Text("링머슬업")
                                Text("차오르기")
                                

                                Item(date: "2018-09", title: "반동머슬업시절", link: "https://photos.app.goo.gl/k4VjgbPYYv5pxdZU9")

                                Item(date: "2018-09", title: "헬스1년차 편집", link: "https://photos.app.goo.gl/DadxLu3KS8FKAEmRA")
                                
                                Item(date: "2018-07", title: "반동머슬업 초기", link: "https://photos.app.goo.gl/EzLS3rE7gD1oU7Gy9")

                            }
                            Section("러닝") {
                                Text("10키로")
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0.9, green: 0.9, blue: 1.0))
                    .navigationBarTitle("", displayMode: .inline) // inline 이렇게 주면 큰 제목을 없앨 수 있다.
                    //.navigationBarHidden(true)
                    // 내비 상단에 메뉴 버튼을 추가. 이건 보이게 한다.
                    .navigationBarItems(leading:
                                            Button(action: {
                        print("menu click")
                    }) {
                        Image(systemName: "line.3.horizontal")
                    }
                    )
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
