//
//  MyTestView.swift
//  myprofile
//
//  Created by mobile on 2022/12/06.
//

import SwiftUI

struct MyTestView: View {
    var title : String
    var bgcolor : Color
    
    var body: some View {
        VStack {
            Divider().opacity(0)
            Spacer()
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 45))
            Spacer()
        }
        .background(bgcolor)
        // 이 뷰를 출력할 때는 애니매이션 효과를 끈다.
        // 애니매이션 효과로 인해 내부 데이터가 즉시 안보일 수 있기 때문에 끄는 것이 좋을 수 도 있음.
        .animation(.none)
    }
}

struct MyTestView_Previews: PreviewProvider {
    static var previews: some View {
        MyTestView(title:"Home", bgcolor:Color.blue)
    }
}
