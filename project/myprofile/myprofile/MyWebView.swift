//
//  MyWebView.swift
//  myprofile
//
//  Created by mobile on 2022/12/15.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable  {
    var urlToLoad : String
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        guard let url = URL(string: self.urlToLoad) else {
            return webView
        }
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "http://google.com")
    }
}
