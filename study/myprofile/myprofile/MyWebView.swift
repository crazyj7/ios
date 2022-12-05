//
//  MyWebView.swift
//  myprofile
//
//  Created by mobile on 2022/12/05.
//

import SwiftUI
import WebKit

struct MyWebView : UIViewRepresentable {
    var urlToLoad : String

    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        guard let surl = URL(string: self.urlToLoad) else {
            return webview
        }
        webview.load(URLRequest(url : surl))
        return webview
    }
       
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
    }
    
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "http://m.daum.net")
    }
}
