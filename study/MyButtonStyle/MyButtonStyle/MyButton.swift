//
//  MyButton.swift
//  MyButtonStyle
//
//  Created by mobile on 2022/12/09.
//

import SwiftUI

enum ButtonType {
    case short, long, tap, rotate
}


struct MyButton: ButtonStyle {
    var bkcolor : Color
    var type : ButtonType
    

    func checkShort() -> Bool {
        if (self.type == .short) {
            return true
        }
        return false
    }
    
    // 하나로 만들려고 했는데, 속성들을 같이 주면, 애니매이션 효과가 안되는 경우들이 발생하여
    // 특성별로 뷰를 따로 만들어야 할 것 같다. 
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
//            .fontWeight(.bold) // fontWeight는 적용안됨. ios16>
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(bkcolor)
            .cornerRadius(20)
        
//            .scaleEffect(
//                self.type == .short ? (                configuration.isPressed ? 1.3 : 1.0)
//                : 1.0 )

        
//            .rotationEffect(self.type == .rotate ? (configuration.isPressed ? .degrees(90)
//                             : .degrees(0)
//                                                   ) : .degrees(0)
//            )

            .rotationEffect(configuration.isPressed ? .degrees(90)
                             : .degrees(0)         )

//            .onTapGesture {
//                if (self.type == .short) {
//                    let haptic = UIImpactFeedbackGenerator(style: .light)
//                    haptic.impactOccurred()
//                }
//            }
//            .onLongPressGesture(perform: {
//                if (self.type == .long) {
//                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
//                    haptic.impactOccurred()
//                }
//            })
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
        }, label: {
                Text("hello")
        }
        )
        //.buttonStyle( MyButton(bkcolor: Color.blue, type: .short) )
        .buttonStyle( MyButton(bkcolor: Color.red, type: .rotate) )
    }
}
