//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiromichi Aoki on 9/19/20.
//  Copyright © 2020 aohirot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UIImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    var imageIndex = 0

    var images : [UIImage]! = [
        UIImage(named: "Image1.jpg")!,
        UIImage(named: "Image2.jpg")!,
        UIImage(named: "Image3.jpg")!]
    
    @objc func changeImage() {
           imageIndex += 1
        if (imageIndex == images.count) {
            imageIndex = 0
           }
           UIImageView.image = images[imageIndex]
       }
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = images[0]

        UIImageView.image = imageView
        playStopButton.setTitle("再生", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のResultViewControllerを取得する
        let imageZoomViewController: ImageZoomViewController = segue.destination as! ImageZoomViewController
        imageZoomViewController.imageScreen = images[imageIndex]
    }
    
    @IBAction func tapAction(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "ImageZoomViewController", sender: nil)
        if (timer != nil) {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            //タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playStopButton.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func backImage(_ sender: UIButton) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    @IBAction func startStop(_ sender: Any) {
        
        if (timer == nil) {
        // 再生時の処理を実装

        // タイマーをセットする
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            playStopButton.setTitle("停止", for: .normal)
            } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            //タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playStopButton.setTitle("再生", for: .normal)
        }
}
}
