//
//  Model.swift
//  WWSVGImageView
//
//  Created by William.Weng on 2026/1/30.
//

import Foundation
import SwiftUI

// MARK: - 解析XML工具
extension WWSVGImageView {
    
    final class XMLParseHandler: NSObject, XMLParserDelegate {
        
        var attributes : [ String : String ]?
        
        func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [ String : String ]) {
            self.attributes = attributes
        }
    }
}

// MARK: - UIKit轉成SwiftUI
extension WWSVGImage {
    
    struct SVGImage : UIViewRepresentable {
        
        typealias UIViewType = WWSVGImageView
        
        let svg : String
        
        func makeUIView(context: Context) -> UIViewType {
            return WWSVGImageView.build()
        }
        func updateUIView(_ webView: UIViewType, context: Context) {
            webView.load(svg: svg)
        }
    }
}
