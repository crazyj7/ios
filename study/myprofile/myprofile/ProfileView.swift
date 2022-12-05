//
//  ProfileView.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    static let dateFormatter : DateFormatter = {
            let format = DateFormatter()
            format.dateFormat = "YYYY년 MM월 dd일 HH시 mm분 ss.SSS"
            return format
        } ()
    var today = Date()
    
    var msg : String = """
디폴트 Back 버튼이 파란색이라서 배경색을 같게 하니 보이지 않는다.
iOS 14에서는 상단 보호 영역을 두는데, 무시하게 하면 전체가 칠해짐.
그래서 Custom Back 을 만들어 색상 변경!!!
"""
    var body: some View {
        VStack {
            Divider().opacity(0)
            Spacer()
            Text("Who am I?")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 45))
            
            Image("profile")	
                .resizable()
                .scaledToFill()
                .frame(width:250, height:250)
                .padding(.trailing, 10)
                .clipShape(Circle())
                .shadow(color: .gray, radius:10, x:0, y:10)
                .overlay(
                    Circle().strokeBorder(Color.yellow, lineWidth:15)
                )
            
            Text("Today is \(today, formatter: ProfileView.dateFormatter)")
                .foregroundColor(.white)
            
            Text(msg).foregroundColor(.green).font(.system(size: 18))

            Spacer()
        }
        .background(Color.blue)
        // iOS 14에서는 위에서 배경색을 지정하고, 아래와 같이 영역처리를 하면 전체가 칠해진다. 
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("My Profile", displayMode: .inline)   // 제목.
        .navigationBarBackButtonHidden()    // 디폴트 백 버튼 숨기기
        .navigationBarItems(
            leading:
                // 커스텀 Back 버튼 추가하기...
                Button(action: { presentationMode.wrappedValue.dismiss() })
                {
                    HStack {
                    Image(systemName: "chevron.backward")
                            .foregroundColor(Color.yellow)
                    Text("Custom Back")
                            .foregroundColor(Color.yellow)
                    }
                }

            // 우측 버튼을 만들어 하위 다른 곳으로 링크.
            , trailing:
                NavigationLink(destination: Text("test"))
                {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(Color.red)
                }
        )
        // .accentColor(.red) // 네비게이션 바 텍스트 색상 변경하려했으나, Back 은 안되었다.
        // 오른쪽 버튼에는 반영됨. 그냥 해당 이미지의 색상 변경.
        
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
