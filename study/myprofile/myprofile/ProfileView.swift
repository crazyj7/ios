//
//  ProfileView.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI

struct ProfileView: View {
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
            
            Spacer()
        }
        .background(Color.blue)
        .navigationBarTitle("My Profile")
        .navigationBarItems(
            trailing:
                NavigationLink(destination: Text("test"))
                {
                    Image(systemName: "bookmark.fill")
                }
        )
        
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
