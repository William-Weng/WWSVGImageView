//
//  SwiftUI.swift
//  Example
//
//  Created by William.Weng on 2026/1/30.
//

import SwiftUI
import WWSVGImageView

struct SvgView: View {
    
    @State var color: String
    
    var body: some View {
        
        ZStack {
            WWSVGImage(svg: """
                <svg viewBox= "0 0 100 100">
                  <circle cx="50" cy="50" r="40" fill="\(color)">
                    <animate attributeName="r" values="40;20;40" dur="2s" repeatCount="indefinite"/>
                  </circle>
                </svg>
                """)
        }
    }
}

#Preview {
    SvgView(color: "rgba(0,255,0,0.5)")
}
