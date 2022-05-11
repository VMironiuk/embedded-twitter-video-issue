//
//  ViewController.swift
//  EmbeddedTweet
//
//  Created by Vladimir Mironiuk on 10.05.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }


    private func setupWebView() {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        
        // Twitter video doesn't play, other videos can play by tap action
        configuration.mediaTypesRequiringUserActionForPlayback = .all
        
        // Twitter video doesn't play, other videos can play by tap action
//        configuration.mediaTypesRequiringUserActionForPlayback = .video
        
        // Twitter video plays correctly by tap action, but other videos can play automatically which is not correct behaviour for me
//        configuration.mediaTypesRequiringUserActionForPlayback = .audio
        
        // Twitter video plays correctly by tap action, but other videos can play automatically which is not correct behaviour for me
//        configuration.mediaTypesRequiringUserActionForPlayback = []
        
        
        let html = """
                <html>
                   <body>
                      <blockquote class="twitter-tweet">
                         <p lang="en" dir="ltr">Jamie Carragher meets James Bond 🤝<br><br>Daniel Craig discusses his love of Liverpool, the thrill he felt meeting the players in person, his final appearance as James Bond, and whether Jurgen Klopp would make a good 007 🎬⚽<a href="<some_link>">pic.twitter.com/kxYrAO3LIh</a></p>
                         &mdash; Sky Sports News (@SkySportsNews) <a href="https://twitter.com/SkySportsNews/status/1444597028286259203?ref_src=twsrc%5Etfw">October 3, 2021</a>
                      </blockquote>
                      <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                   </body>
                </html>
                """
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])

        webView.loadHTMLString(html, baseURL: nil)
    }
}

