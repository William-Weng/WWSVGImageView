# WWSVGImageView
[![SwiftUI](https://img.shields.io/badge/SwiftUI-524520?logo=swift
)](https://developer.apple.com/swiftui/) [![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-16.0](https://img.shields.io/badge/iOS-16.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWSVGImageView) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Simple use of SVG images.](https://github.com/ZeeZide/SVGWebView)
- [簡單的使用SVG圖片。](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/將-svg-變成-uibezierpath-c9a6cd5b69ba)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWSVGImageView.git", .upToNextMajor(from: "1.0.0"))
]
```

### 可用函式 (Function)
|函式|功能|
|-|-|
|build()|建立WWSVGImageView|
|load(svg:)|載入SVG圖片|
|init(svg:)|載入SVG圖片 - SwiftUI|

### Example 1
```swift
import UIKit
import WWSVGImageView

final class ViewController: UIViewController {
    
    private let svg = """
        <svg viewBox= "0 0 100 100">
            <circle cx="50" cy="50" r="40" fill="gold">
                <animate attributeName="r" values="40;20;40" dur="2s" repeatCount="indefinite"/>
            </circle>
        </svg>
        """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = WWSVGImageView.build()
        
        imageView.frame = view.bounds
        imageView.load(svg: svg)
        
        view.addSubview(imageView)
    }
}
```

### Example 2
```
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
```
