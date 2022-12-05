//
//  MyCard.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI

struct MyCard: View {
    var bgcolor : Color
    var title : String
    var msg : String
    var icon : String
    
    var body: some View {
        HStack (spacing: 20) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            VStack (alignment: .leading) {
                Divider().opacity(0)
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer().frame(height: 5)
                Text(msg)
                    .foregroundColor(.white)
            }
        }
        .padding(20)
        .background(bgcolor)
        .cornerRadius(10)
        .padding(.bottom, 10)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(bgcolor: Color.blue, title: "인사말", msg: "반갑습니다. ", icon: "person.crop.circle.fill")
    }
}
