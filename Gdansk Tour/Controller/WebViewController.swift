//
//  WebView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/29/22.
//

import WebKit
import SwiftUI

struct WebViewController: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebViewController.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
