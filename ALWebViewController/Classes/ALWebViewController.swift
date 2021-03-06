//
//  ALWebViewController.swift
//  ALWebViewController
//
//  Created by Soner Güler on 7.02.2020.
//

import UIKit
import WebKit

public enum ALWebContentType {
    case url(url: URL)
    case html(html: String)
}

open class ALWebViewController: UIViewController {
    
    var content: ALWebContentType
    
    private var url: URL?
    
    private var htmlString: String?
    
    open lazy var webView: WKWebView = {
        var view = WKWebView()
        return view
    }()
    
    
    public init(content: ALWebContentType) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func loadView() {
        super.loadView()
        view.addSubview(webView)
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.frame = view.frame
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    private func load() {
        switch content {
        case .html(let html):
            webView.loadHTMLString(html, baseURL: nil)
        case .url(let url):
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
