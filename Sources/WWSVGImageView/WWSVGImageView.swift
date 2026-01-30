// The Swift Programming Language
// https://docs.swift.org/swift-book


import WebKit

// MARK: - 使用SVG圖片
open class WWSVGImageView: WKWebView {}

// MARK: - 公開函式
public extension WWSVGImageView {
    
    /// 建立WWSVGImageView
    /// - Returns: WWSVGImageView
    static func build() -> WWSVGImageView {
        
        let webView: WWSVGImageView = WWSVGImageView._build(html: "")
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        
        return webView
    }
}

// MARK: - 公開函式
public extension WWSVGImageView {
    
    /// [載入SVG圖片](https://github.com/ZeeZide/SVGWebView)
    /// - Parameters:
    ///   - svg: SVG程式碼
    ///   - useRWD: [RWD支援](https://medium.com/frochu/html-meta-viewport-setting-69fbb06ed3d8)
    func load(svg: String, useRWD: Bool = true) {
        
        let content = """
            <div style="width: 100%; height: 100%; background-color: #0000;">\(combineSVG(svg))</div>
        """
        
        let html = """
        <!DOCTYPE html>
        <html lang="zh-Hant">
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          </head>
          <body>
            \(content)
          </body>
        </html>
        """
        
        if useRWD {
            loadHTMLString(html, baseURL: nil)
        } else {
            loadHTMLString(content, baseURL: nil)
        }
    }
}

// MARK: - 小工具
private extension WWSVGImageView {
    
    /// 組合SVG文字
    /// - Parameter svg: SVG文字
    /// - Returns: String
    func combineSVG(_ svg: String) -> String {
        
        guard let tagRange = tagRange(svg: svg) else { return svg }
        
        let oldTag = svg[tagRange]
        let html = "\(oldTag)" + "</svg>"
        
        var attributes = parseAttributes(html: html) ?? [:]
        
        attributes = viewBoxStandardization(attributes: attributes)
        attributes.removeValue(forKey: "x")
        attributes.removeValue(forKey: "y")
        attributes["width"]  = "100%"
        attributes["height"] = "100%"
        
        let newTag = combineHtmlTag("svg", attributes: attributes)
        
        if (newTag != oldTag) { return svg.replacingCharacters(in: tagRange, with: newTag) }
        return svg
    }

    /// 組裝XML的Tag屬性 => <svg viewBox="0 0 100 100" width="100%" height="100%">
    /// - Parameters:
    ///   - tag: HTML Tag
    ///   - attributes: 各屬性值
    /// - Returns: String
    func combineHtmlTag(_ tag: String, attributes: [ String : String ]) -> String {
        
        var xml = "<\(tag)"
        
        for (key, value) in attributes {
            xml += " \(key)=\""
            xml += value._replacingHtmlEntities()
            xml += "\""
        }
        xml += ">"
                
        return xml
    }
    
    /// 取得<svg></svg>之間的內容範圍
    /// - Parameter svg: svg字串
    /// - Returns: Range<String.Index>?
    func tagRange(svg: String) -> Range<String.Index>? {
        
        guard let startRange = svg.range(of: "<svg"),
              let endRange = svg.range(of: ">", range: startRange.upperBound..<svg.endIndex)
        else {
            return nil
        }
        
        return startRange.lowerBound..<endRange.upperBound
    }
    
    /// 解析Tag內的屬性值 => <svg height="100" width="100"> => ["height": "100", "width": 100]
    /// - Parameter html: String
    /// - Returns: [String: String]?
    func parseAttributes(html: String) -> [String: String]? {
        
        let parser = XMLParser(data: Data(html.utf8))
        let handler = XMLParseHandler()
        
        parser.delegate = handler
        
        guard parser.parse() else { return nil }
        return handler.attributes
    }
    
    /// [補足沒有viewBox屬性的問題](https://ithelp.ithome.com.tw/articles/10157476)
    /// - Parameter attributes: 各屬性值
    /// - Returns: [String: String]
    func viewBoxStandardization(attributes: [String: String]) -> [String: String] {
                
        guard attributes["viewBox"] == nil else { return attributes }
        
        var _attributes: [String: String] = attributes
        
        let width = _attributes.removeValue(forKey: "width") ?? "100%"
        let height = _attributes.removeValue(forKey: "height") ?? "100%"
        let x = _attributes.removeValue(forKey: "x") ?? "0"
        let y = _attributes.removeValue(forKey: "y") ?? "0"
        
        _attributes["viewBox"] = "\(x) \(y) \(width) \(height)"
        
        return _attributes
    }
}
