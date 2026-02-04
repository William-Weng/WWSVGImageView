# WWSVGImageView
[![SwiftUI](https://img.shields.io/badge/SwiftUI-524520?logo=swift
)](https://developer.apple.com/swiftui/) [![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-16.0](https://img.shields.io/badge/iOS-16.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWSVGImageView) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Simple use of SVG images.](https://github.com/ZeeZide/SVGWebView)
- [簡單的使用SVG圖片。](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/將-svg-變成-uibezierpath-c9a6cd5b69ba)

https://github.com/user-attachments/assets/755e2dc0-8054-4e0b-b831-85f16ffdc99c

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWSVGImageView.git", .upToNextMajor(from: "1.0.2"))
]
```

### 可用函式 (Function)
|函式|功能|
|-|-|
|build()|建立WWSVGImageView|
|load(svg:useRWD:)|載入SVG圖片|
|init(svg:useRWD:)|載入SVG圖片 - SwiftUI|

### Example - UIKit
```swift
import UIKit
import WWSVGImageView

final class ViewController: UIViewController {
    
    private let svg = """
    <svg viewBox="0 0 160 160" width="160" height="160">
        <circle cx="80" cy="80" r="50" fill="#67AAF9" />
        <g transform="matrix(0.866, -0.5, 0.25, 0.433, 80, 80)">
            <path d="M 0,70 A 65,70 0 0,0 65,0 5,5 0 0,1 75,0 75,70 0 0,1 0,70Z" fill="#FFF">
                <animateTransform attributeName="transform" type="rotate" from="360 0 0" to="0 0 0" dur="1s" repeatCount="indefinite" />
            </path>
        </g>
        <path d="M 50,0 A 50,50 0 0,0 -50,0Z" transform="matrix(0.866, -0.5, 0.5, 0.866, 80, 80)" fill="#67AAF9"/>
    </svg>
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = WWSVGImageView.build()
        
        imageView.frame = .init(origin: .zero, size: .init(width: 320, height: 320))
        imageView.center = view.center
        
        view.addSubview(imageView)
        imageView.load(svg: svg)
    }
}
```

### Example - SwiftUI
```swift
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
        
        let svg = """
            <svg viewBox="0 0 160 160" width="160" height="160">
                <circle cx="80" cy="80" r="50" fill="\(color)" />
                <g transform="matrix(0.866, -0.5, 0.25, 0.433, 80, 80)">
                <path d="M 0,70 A 65,70 0 0,0 65,0 5,5 0 0,1 75,0 75,70 0 0,1 0,70Z" fill="#FFF">
                    <animateTransform attributeName="transform" type="rotate" from="360 0 0" to="0 0 0" dur="1s" repeatCount="indefinite" />
                </path></g>
                <path d="M 50,0 A 50,50 0 0,0 -50,0Z" transform="matrix(0.866, -0.5, 0.5, 0.866, 80, 80)" fill="\(color)"/>
            </svg>
        """
        
        ZStack {
            WWSVGImage(svg: svg)
            .frame(width: 320, height: 320)
            .background(Color.black)
        }
    }
}

#Preview {
    SvgView(color: "#67AAF9")
}
```
