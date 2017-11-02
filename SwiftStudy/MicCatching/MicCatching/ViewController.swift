//
//  ViewController.swift
//  MicCatching
//
//  Created by yang song on 02/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

// http://blog.csdn.net/u013282174/article/details/44653291
// http://www.cnblogs.com/javawebsoa/archive/2013/05/20/3089511.html

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: - static_ or define variable
    static let ALPHA = 0.05

    // MARK: - Ui property
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var averageInputLabel: UILabel!
    @IBOutlet weak var peakInputLabel: UILabel!
    
    // MARK: - Handle or Manager property
    var audioRecoder: AVAudioRecorder?
    var timer: Timer?

    // MARK: - Data property
    var lowPassResult: Double = 0.0

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setRecorder()

    }

    // MARK: - IBActions
    @IBAction func play(_ sender: UIButton) {
        audioRecoder?.record()
        setTimer()
    }

    // MARK: - Public method

    // MARK: - Private method
    /// 初始化录音
    func setRecorder() {
        if let _ = audioRecoder {

        } else {
            let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentationDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let url = URL(string: "/dev/null")

            let settings = [AVSampleRateKey: 44100.0,
                            AVFormatIDKey: kAudioFormatAppleLossless,
                            AVNumberOfChannelsKey: 1,
                            AVEncoderAudioQualityKey: AVAudioQuality.max] as [String : Any]
            // throw 在 函数声明时 表明可以抛出一个错误
            // try 函数调用时，用do catch 捕获错误
            do {
                audioRecoder = try AVAudioRecorder(url: url!, settings: settings)
                audioRecoder?.prepareToRecord()
                audioRecoder?.isMeteringEnabled = true
                audioRecoder?.record()

                setTimer()
            } catch {
                fatalError("出错了：\(error)")
            }
        }
    }

    /// 设定timer
    func setTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: { (timer) in

            self.audioRecoder?.updateMeters()
            // 此计数是以对数刻度计量的，-160表示完全安静，0表示最大输入值。
            let average = self.audioRecoder?.averagePower(forChannel: 0)/** 平均功率 */
            let peakPower = self.audioRecoder?.peakPower(forChannel: 0)/** 峰值功率 */
            self.averageInputLabel.text = String(format: "%f", average!)
            self.peakInputLabel.text = String(format: "%f", peakPower!)
            // 使用低通滤波来消除高频声音对电平带来的影响
            // 将其转换为0-1，0代表完全安静，1代表最大音量
            let peakPowerForChannel = pow(10, (ViewController.ALPHA * Double(peakPower!)))
            self.lowPassResult = ViewController.ALPHA * peakPowerForChannel + (1.0 - ViewController.ALPHA) * self.lowPassResult
            // 低通滤波值超过一定门槛范围时，我们就可以判断有人向麦克吹了气。门槛范围值的设定是一种技巧。它设定太小，则太容易被触发，如果设定太高，则必须长时间用尽力气吹气才会有效果。
            if self.lowPassResult > 0.95 {

            }

        })
    }              

    // MARK: - Protocol conformance

    // MARK: - UITextFieldDelegate

    // MARK: - UITableViewDataSource

    // MARK: - UITableViewDelegate

    // MARK: - NSCopying
}

