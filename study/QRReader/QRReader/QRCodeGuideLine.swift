//
//  QRCodeGuideLine.swift
//  QRReader
//
//  Created by mobile on 2022/12/09.
//

import SwiftUI

enum QRGuideStyle {
    case RoundRect, RountRectDim, None
}

struct QRUideModeNone : View {
    var body : some View {
        Divider().opacity(0)
    }
}

struct QRGuideModeRoundRect : View {
    var geo : GeometryProxy
    
    var body : some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(style: StrokeStyle(lineWidth: 5, dash: [13]))
            .frame(width: geo.size.width/2, height: geo.size.height/3)
            .foregroundColor(Color.green)
            .position(CGPoint(x: geo.size.width/2, y: geo.size.height/2))
    }
}

struct QRGuideModeRountRectDim : View {
    var geo : GeometryProxy
    var dark : Double = 0.7
    var z_width : Double = 0.6
    var z_height : Double = 0.4
    
    var body : some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(self.dark))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: geo.size.width * self.z_width, height: geo.size.height * self.z_height)
                .position(CGPoint(x: geo.size.width/2, y: geo.size.height/2))
                .blendMode(.destinationOut)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: StrokeStyle(lineWidth:5, dash:[13]))
                        .foregroundColor(.green)
                        .frame(width: geo.size.width * self.z_width, height: geo.size.height * self.z_height)
                        .position(CGPoint(x: geo.size.width/2, y: geo.size.height/2))
                )
        }
        .compositingGroup()
    }
}


struct QRCodeGuideLine: View {
    @State var style : QRGuideStyle
    
    @ViewBuilder
    func getGuideView(geo : GeometryProxy) -> some View {
        switch self.style {
        case .None:
            QRUideModeNone()
        case .RoundRect:
            QRGuideModeRoundRect(geo: geo)
        case .RountRectDim:
            QRGuideModeRountRectDim(geo: geo)
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            getGuideView(geo: geo)
        }
    }
}

struct QRCodeGuideLine_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLine(style: QRGuideStyle.None)
    }
}
