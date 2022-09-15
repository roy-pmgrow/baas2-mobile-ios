//
//  MainViewController.swift
//  BaasMobile
//
//  Created by pmgrow on 2022/09/14.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    
    var webView: WKWebView!
    let url: URL = URL(string:"http://localhost:3000")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initWebView()
    }
    
    func initWebView() {
       let webConfiguration = WKWebViewConfiguration()
       webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), configuration: webConfiguration)
       webView.uiDelegate = self
       webView.isOpaque = false
       webView.backgroundColor = .clear
       webView.scrollView.backgroundColor = .clear
       webView.scrollView.showsHorizontalScrollIndicator = false
       webView.scrollView.showsVerticalScrollIndicator = false
       detailView.addSubview(webView)
        
       webView.load(URLRequest(url: url))
   }
}

extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension MainViewController: WKUIDelegate {
    
}
