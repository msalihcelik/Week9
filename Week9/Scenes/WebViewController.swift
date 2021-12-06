//
//  WebViewController.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 3.12.2021.
//

import UIKit
import WebKit

final class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.scrollView.bounces = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(WebViewController.refreshWebView), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://www.themoviedb.org")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.navigationDelegate = self
    }
    
    @objc func refreshWebView(sender: UIRefreshControl) {
        webView.reload()
        sender.endRefreshing()
    }
}

//MARK: - WebKitNavigationDelegate Methods
extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            print(urlStr)
        }
        decisionHandler(.allow)
    }
}
