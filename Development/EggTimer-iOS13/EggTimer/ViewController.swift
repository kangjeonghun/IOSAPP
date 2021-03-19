//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 타이머가 끝나면 Label의 text를 변경하기 위해 아웃렛 변수로 설정
    @IBOutlet weak var titleLabel: UILabel!
    // 시각적으로 진행률 확인하기 위해 progressBar 아웃렛 변수 설정
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTitles: [String: Int] = ["Soft": 10, "Medium": 20, "Hard": 30]
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        // 다른 달걀을 눌렀을 때, progress를 초기화 시키기위해
        secondsPassed = 0
       
        timer.invalidate()
       
        let hardness = sender.currentTitle!
        totalTime = eggTitles[hardness]!
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        else{
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}
