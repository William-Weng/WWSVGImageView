//
//  Extension.swift
//  WWSVGImageView
//
//  Created by William.Weng on 2026/1/30.
//

import Foundation
import WebKit

// MARK: - String
extension String {
    
    /// 取代HTML特殊字元 ("&" => "&amp;")
    /// - Returns: String
    func _replacingHtmlEntities() -> String {
        
        var html = self
        
        let entities: [WWSVGImageView.HtmlEntity] = [
            (key: "&", value: "&amp;"),
            (key: "<", value: "&lt;"),
            (key: ">", value: "&gt;"),
            (key: "'", value: "&apos;"),
            (key: "\"", value: "&quot;"),
        ]
        
        entities.forEach({ (key, value) in
            html = html.replacingOccurrences(of: key, with: value)
        })
        
        return html
    }
}

// MARK: - WKWebView
extension WKWebView {
    
    /// 建立WKWebView
    /// - Parameter html: String
    /// - Returns: WKWebView
    static func _build<T>(html: String) -> T where T: WKWebView {
        
        let configuration = WKWebViewConfiguration._svgBuild()
        let webView = T(frame: .zero, configuration: configuration)
        
        webView.loadHTMLString(html, baseURL: nil)
        webView.backgroundColor = .clear
        
        return webView
    }
}

// MARK: - WKPreferences
private extension WKPreferences {
    
    /// 建立WKPreferences
    /// - Parameter javaScriptCanOpenWindowsAutomatically: Bool
    /// - Returns: WKPreferences
    static func _build(javaScriptCanOpenWindowsAutomatically: Bool) -> WKPreferences {
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = javaScriptCanOpenWindowsAutomatically
        
        return preferences
    }
}

// MARK: - WKWebViewConfiguration
 extension WKWebViewConfiguration {
    
    /// 建立SVG相關設定
    /// - Parameters:
    ///   - allowsAirPlayForMediaPlayback: Bool
    ///   - javaScriptCanOpenWindowsAutomatically: Bool
    /// - Returns: WKWebViewConfiguration
    static func _svgBuild(allowsAirPlayForMediaPlayback: Bool = false, javaScriptCanOpenWindowsAutomatically: Bool = false) -> WKWebViewConfiguration {
        
        let preferences = WKPreferences._build(javaScriptCanOpenWindowsAutomatically: javaScriptCanOpenWindowsAutomatically)
        let configuration = WKWebViewConfiguration._build(preferences: preferences, allowsAirPlayForMediaPlayback: allowsAirPlayForMediaPlayback)
        
        return configuration
    }
    
    /// 建立WKWebViewConfiguration
    /// - Parameters:
    ///   - preferences: WKPreferences
    ///   - allowsAirPlayForMediaPlayback: Bool
    /// - Returns: WKWebViewConfiguration
    static func _build(preferences: WKPreferences, allowsAirPlayForMediaPlayback: Bool) -> WKWebViewConfiguration {
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.allowsAirPlayForMediaPlayback = allowsAirPlayForMediaPlayback
        
        return configuration
    }
}
