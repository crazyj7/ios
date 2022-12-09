//
//  ContentView.swift
//  QRReader
//
//  Created by mobile on 2022/12/09.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    
    var body: some View {
        VStack(spacing: 10) {
            
            if scannedCode != nil && scannedCode!.count>0 {
                Button( action: {
                    // 웹으로 연결
                    if scannedCode!.starts(with: "http") {
                        if let url = URL(string: scannedCode!) {
                            UIApplication.shared.open(url)
                        }
                    }
                }) {
                    Text( scannedCode! )
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
            }
            
            Button(action: {
                self.scannedCode = nil
                isPresentingScanner = true
            }, label: {
                Text("Scan Code")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 5)
                            .foregroundColor(.blue)
                    )
            })
            
            
            Text("Scan a QR code to begin")
        }
        .sheet(isPresented: $isPresentingScanner) {
            ZStack {
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        scannedCode = result.string
                        isPresentingScanner = false
                    }
                }
//                QRCodeGuideLine(style: QRGuideStyle.None)
//                QRCodeGuideLine(style: QRGuideStyle.RoundRect)
                QRCodeGuideLine(style: QRGuideStyle.RountRectDim)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
