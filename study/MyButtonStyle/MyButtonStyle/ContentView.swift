//
//  ContentView.swift
//  MyButtonStyle
//
//  Created by mobile on 2022/12/09.
//

import SwiftUI
import ExytePopupView


struct ContentView: View {
    @State private var input : String = ""
    @State private var passwd : String = ""
    
    @State var showPopup = false
    
    @State var shouldShowBottomSolidMessage  : Bool = false

    func isSE() -> Bool {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaInsets.bottom == 0
    }

    func createBottomSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image(systemName: "book.fill")
                .font(.system(size:40))
                .foregroundColor(Color.white)
                .background(Color.yellow)
            VStack(alignment: .leading) {
                Text("안내")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                Text("솔리드 메시지입니다.")
                    .lineLimit(2)  // 범위를 넘어가면 줄 바뀌는데, 2줄까지로 제한 출력한다.  ...표시
                    .font(.system(size:14))
                    .foregroundColor(Color.white)
                Divider().opacity(0)
            }.background(Color.red)
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(width: UIScreen.main.bounds.width)
        // 아이폰 11의 경우 바닥에서 좀 띄운다. SE에서는 바닥에 붙임.
        .padding(.bottom, isSE() ? 0 : 25)
        .background(Color.purple)
    }
    
    var body: some View {
        
        
        
        ZStack {
            VStack {
                
                Spacer()

                
                Button(action: {
                    print("button clicked")
                }, label: {
                    Text("탭")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(20)
                })
                
                Button(action: {
                }, label: {
                    Text("hello")
                }
                ).buttonStyle( MyButton(bkcolor: Color.blue, type: .short) )
                
                
                // 텍스트 입력
                HStack {
                    TextField("input id", text: $input)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    // 지우기 버튼.
                    Button( action: {
                        self.input=""
                    }) {
                        if (self.input.count > 0 ) {
                            Image(systemName: "multiply.circle.fill").foregroundColor(.secondary)
                                .font(.system(size: 25))
                        }
                    }
                }
                
                // 비밀번호입력.
                HStack {
                    SecureField("input pwd", text: $passwd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    Button( action: {
                        self.passwd=""
                    }) {
                        if ( self.passwd.count > 0 ) {
                            Image(systemName: "multiply.circle.fill").foregroundColor(.secondary)
                                .font(.system(size: 25))
                        }
                    }
                }
                Text("input pwd= \(passwd)")
                
                Button(action: {
                    self.showPopup = true
                }, label: {
                    Text("Toast!")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                })

                Button(action: {
                    self.shouldShowBottomSolidMessage = true
                }, label: {
                    Text("BottomSolid")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.yellow)
                })

                Spacer()
                
                

                
            }
                        
 
        }
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $showPopup, autohideIn: 2) {
            Text("Popup Message!")
                .frame(width:200, height: 60)
                .background(Color.green)
                .cornerRadius(30)
        }
        .popup(isPresented: $shouldShowBottomSolidMessage,
            type: .toast, position: .bottom,
            animation: .easeInOut, autohideIn: 2, closeOnTap: true,
            closeOnTapOutside: true, view : {
            self.createBottomSolidMessage()
        })
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
