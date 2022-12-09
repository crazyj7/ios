//
//  MyTabView2.swift
//  myprofile
//
//  Created by mobile on 2022/12/06.
// 커스터마이징 탭뷰


import SwiftUI

enum TabIndex {
    case home, cart, profile
}

struct MyTabView2: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var tabIndex : TabIndex = .home
    @State var scaleIcon : CGFloat = 1.5
    
    func getViewColor() -> Color {
        switch self.tabIndex {
        case .home:
            return Color.blue
        case .cart:
            return Color.purple
        case .profile:
            return Color.green
        }
    }
    
    func getView() -> MyTestView {
        switch self.tabIndex {
        case .home:
            return MyTestView(title: "HOME", bgcolor: getViewColor())
            
        case .cart:
            return MyTestView(title: "CART", bgcolor: getViewColor())
            
        case .profile:
            return MyTestView(title: "PROFILE", bgcolor: getViewColor())
            
        }
    }
    
    func getCirclePos(geo : GeometryProxy) -> CGFloat {
        switch self.tabIndex {
            
        case .home:
            return -geo.size.width/3
        case .cart:
            return 0
        case .profile:
            return geo.size.width/3
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .bottom) {
                
                // 탭 뷰
                getView()
                
                // 원을 그림
                Circle().frame(width:90, height:90)
                    .foregroundColor(Color.white)
                    // offset 값을 주면 위치에 + 된다고 생각하면 됨.
                    // bottom==0 조건이면 iphoneSE 로
                    // 아래에 시스템 메뉴가 없어서 다 쓸수 있는 영역임.
                    .offset(x:getCirclePos(geo: geo) , y:
                                UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 0)
                
                // 탭 메뉴
                
                VStack (spacing:0) {
                    HStack (spacing: 0 ) {
                        Button(action: {
                            withAnimation {
                                self.tabIndex = .home
                            }
                        }) {
                            Image(systemName: "house.fill")
                                .font(.system(size: 20))
                                .frame(width: geo.size.width/3, height: 50)
                                .scaleEffect(self.tabIndex == .home ? scaleIcon : 1.0)
                                .foregroundColor( self.tabIndex == TabIndex.home ? getViewColor() : Color.gray)
                        }
                        
                        Button(action: {
                            withAnimation() {
                                self.tabIndex = .cart
                            }
                        }) {
                            
                            Image(systemName: "cart.fill")
                                .font(.system(size: 20))
                                .frame(width: geo.size.width/3, height: 50)
                                .scaleEffect(self.tabIndex == .cart ? scaleIcon : 1.0)
                                .foregroundColor( self.tabIndex == .cart ? getViewColor() : Color.gray)
                        }
                        
                        Button(action: {
                            withAnimation() {
                                self.tabIndex = .profile
                            }
                        }) {
                            
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 20))
                                .frame(width: geo.size.width/3, height: 50)
                                .scaleEffect(self.tabIndex == .profile ? scaleIcon : 1.0)
                                .foregroundColor( self.tabIndex == .profile ? getViewColor() : Color.gray)
                        }
                        
                    } // hstack
                    .background(Color.white)
                    // 기기에 따라 하단에 시스템 자체 슬라이드 표시가 보이는 경우, 너무 가까워
                    // 불편함. 마진을 좀 둬야 된다.
                    // bottom==0 조건이면 iphoneSE 로
                    // 아래에 시스템 메뉴가 없어서 다 쓸수 있는 영역임. 따라서 마진을 안 주고, 그 외의 경우는 마진을 추가.
                    Rectangle()
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                        .foregroundColor(.white)
                } // vstack
                
                
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden()    // 디폴트 백 버튼 숨기기
            .navigationBarItems(
                leading:
                // 커스텀 Back 버튼 추가하기...
                Button(action: { presentationMode.wrappedValue.dismiss() })
                {
                    HStack {
                        Image(systemName: "chevron.backward")
                                .foregroundColor(Color.yellow)
                        Text("Back")
                                .foregroundColor(Color.yellow)
                    }
                }
          )
    }
}

struct MyTabView2_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView2()
    }
}
