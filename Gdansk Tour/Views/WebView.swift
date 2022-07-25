//
//  WebView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/24/22.
//

import SwiftUI

struct WebView: View {
    
    let url: String?
    
    var body: some View {
        WebViewController(urlString: url)
            .edgesIgnoringSafeArea([.bottom])
    }
}

struct WebViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.google.com")
    }
}
