//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2026/1/30.
//

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
        
        imageView.frame = .init(origin: .zero, size: .init(width: 200, height: 200))
        imageView.backgroundColor = .yellow
        imageView.center = view.center
        
        view.addSubview(imageView)
        imageView.load(svg: svg)
    }
}

