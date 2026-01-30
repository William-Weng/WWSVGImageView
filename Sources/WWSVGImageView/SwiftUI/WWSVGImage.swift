//
//  File.swift
//  WWSVGImageView
//
//  Created by iOS on 2026/1/30.
//

import SwiftUI

public struct WWSVGImage: View {
    
    typealias HtmlEntities = (key: String, value: String)
    
    private let svg: String
    
    public init(svg: String) {
        self.svg = svg
    }
    
    public var body: some View {
        SVGImage(svg: svg)
    }
}
