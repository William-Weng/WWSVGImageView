//
//  File.swift
//  WWSVGImageView
//
//  Created by William.Weng on 2026/1/30.
//

import SwiftUI

// MARK: - 給SwiftUI用的
public struct WWSVGImage: View {
        
    private let svg: String
    
    public init(svg: String) {
        self.svg = svg
    }
    
    public var body: some View {
        SVGImage(svg: svg)
    }
}
