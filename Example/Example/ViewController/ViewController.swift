//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2026/1/30.
//

import UIKit
import WWSVGImageView
import WWNetworking

final class ViewController: UIViewController {
    
    private var svgImageView: WWSVGImageView!
    
    /// [第十六章、辣個 SVG 也許會遲到，但永不缺席 。(合) - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天](https://ithelp.ithome.com.tw/articles/10247874)
    private let svg = """
    <svg viewBox="0 0 160 160" width="160" height="160">
        <circle cx="80" cy="80" r="50" fill="#67AAF9" />
        <g transform="matrix(0.866, -0.5, 0.25, 0.433, 80, 80)">
            <path d="M 0,70 A 65,70 0 0,0 65,0 5,5 0 0,1 75,0 75,70 0 0,1 0,70Z" fill="#F00">
                <animateTransform attributeName="transform" type="rotate" from="360 0 0" to="0 0 0" dur="1s" repeatCount="indefinite" />
            </path>
        </g>
        <path d="M 50,0 A 50,50 0 0,0 -50,0Z" transform="matrix(0.866, -0.5, 0.5, 0.866, 80, 80)" fill="#67AAF9"/>
    </svg>
    """
    
    /// [How to Animate SVG Without CSS or JavaScript - Xyris - Free Online SVG Animator](https://xyris.app/blog/how-to-animate-svg-without-css-or-javascript/)
    private let svgUrl = "https://xyris.app/wp-content/uploads/2024/11/day-tripper.svg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSVGFromLocal()
    }
    
    @IBAction func downloadUrl(_ sender: UIBarButtonItem) {
        loadSVGFromURL(svgUrl)
    }
}

// MARK: - 小工具
private extension ViewController {
    
    func loadSVGFromLocal() {
        
        svgImageView = WWSVGImageView.build()
        
        svgImageView.frame = .init(origin: .zero, size: .init(width: view.bounds.width, height: 320))
        svgImageView.center = view.center
        
        view.addSubview(svgImageView)
        svgImageView.load(svg: svg)
    }
    
    func loadSVGFromURL(_ urlString: String) {
                
        Task {
            await WWNetworking.shared.download(urlString: urlString, progress: { info in
                print(Float(info.totalWritten) / Float(info.totalSize))
            }, completion: { result in
                switch result {
                case .failure(let error): print(error)
                case .success(let info):
                    
                    guard let data = info.data,
                          let svg = String(data: data, encoding: .utf8)
                    else {
                        return
                    }
                    
                    self.svgImageView.load(svg: svg)
                }
            })
        }
    }
}
