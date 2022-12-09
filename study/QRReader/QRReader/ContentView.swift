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
            if let code = scannedCode {
                NavigationLink("Next page", destination: Text(code), isActive: .constant(true)).hidden()
            }

            Button("Scan Code") {
                isPresentingScanner = true
            }

            Text("Scan a QR code to begin")
        }
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isPresentingScanner = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
