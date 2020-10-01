//
//  ImageZoomViewController.swift
//  SlideshowApp
//
//  Created by Hiromichi Aoki on 9/20/20.
//  Copyright © 2020 aohirot. All rights reserved.
//

import UIKit

class ImageZoomViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @objc var imageScreen: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // デリゲートを設定
        scrollView.delegate = self
        imageView.image = imageScreen
        scrollView.setZoomScale(2.0, animated: true)
        }
        
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
