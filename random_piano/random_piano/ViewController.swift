//
//  ViewController.swift
//  random_piano
//
//  Created by 安田圭佑 on 2022/08/09.
//

import UIKit
import AVFoundation
import Dispatch

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    var player3: AVAudioPlayer?
    var count:Int = 0
    var times: [Double] = []
    var sound_kazu:[Int] = []
    var timeInterval:Date!
    var startDate:Date!
    var diff:Double!
    var url:[URL] = []
    var url2:[URL] = []
    var url3:[URL] = []
    var melody1:[String] = []
    var melody2:[String] = []
    var melody3:[String] = []
    var random1:Int = 0
    var random2:Int = 0
    var random3:Int = 0
    let path:[String] = ["/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-1ド.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-2レ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-3ミ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-4ファ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-5ソ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-6ラ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-7シ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-8ド.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-1ド.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-2レ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-3ミ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-4ファ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-5ソ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-6ラ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-7シ.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-Amコード.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-Cコード.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-Fコード.mp3",
                         "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ1-Gコード.mp3",]
    let melody:[String] = ["1-1ド","1-2レ","1-3ミ","1-4ﾌｧ","1-5ソ","1-6ラ","1-7シ","1-8ド",
                         "2-1ド","2-2レ","2-3ミ","2-4ﾌｧ","2-5ソ","2-6ラ","2-7シ",
                         "1-Am   ","1-C   ","1-F   ","1-G   "]

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var d2: UIButton!
    @IBOutlet weak var kizamu: UIButton!
    @IBOutlet weak var saisei: UIButton!
    @IBOutlet weak var melody1_text: UILabel!
    @IBOutlet weak var melody2_text: UILabel!
    @IBOutlet weak var melody3_text: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sampleImage = UIImage(named: "adpDSC_3882.jpg")
        image.image = sampleImage
        kizamu.isHidden = true
        kizamu.isEnabled = false
        saisei.isHidden = true
        saisei.isEnabled = false
    }

    @IBAction func d(_ sender: Any) {
        text.text = "リズム刻み中"
        times.removeAll()
        sound_kazu.removeAll()
        url.removeAll()
        url2.removeAll()
        url3.removeAll()
        melody1.removeAll()
        melody2.removeAll()
        melody3.removeAll()
        startDate = Date()
        d.isHidden = true
        d.isEnabled = false
        d2.isHidden = true
        d2.isEnabled = false
        kizamu.isHidden = false
        kizamu.isEnabled = true
        saisei.isHidden = true
        saisei.isEnabled = false
    }
    @IBAction func d2(_ sender: Any) {
        times.removeAll()
        sound_kazu.removeAll()
        sound_kazu = [1,1,1,1,1,1]
        url.removeAll()
        url2.removeAll()
        url3.removeAll()
        melody1.removeAll()
        melody2.removeAll()
        melody3.removeAll()
        startDate = Date()
        d.isHidden = true
        d.isEnabled = false
        d2.isHidden = true
        d2.isEnabled = false
        kizamu.isHidden = false
        kizamu.isEnabled = true
        saisei.isHidden = true
        saisei.isEnabled = false
    }
    
    
    @IBAction func kizamu_d(_ sender: Any) {
        playSound()
        timeInterval = Date()
        diff = timeInterval.timeIntervalSince(startDate)
        times.append(Double(diff))
        sound_kazu.append(Int.random(in: 1...3))
        
        random1 = Int.random(in: 0...18)
        random2 = Int.random(in: 0...18)
        random3 = Int.random(in: 0...18)
        melody1.append(melody[random1])
        melody2.append(melody[random2])
        melody3.append(melody[random3])
        url.append(URL(fileURLWithPath: path[random1]))
        url2.append(URL(fileURLWithPath: path[random2]))
        url3.append(URL(fileURLWithPath: path[random3]))
        
        if times.count == 8{
            d.isHidden = false
            d.isEnabled = true
            d2.isHidden = false
            d2.isEnabled = true
            kizamu.isHidden = true
            kizamu.isEnabled = false
            saisei.isHidden = false
            saisei.isEnabled = true
        }
    }
    
    @IBAction func saisei(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + times[0]){[self] in
            self.playSound2(path:path, url:url[0], url2:url2[0], url3:url3[0],
                   melody1:melody1[0], melody2:melody2[0], melody3:melody3[0], sound_kazu:sound_kazu[0])
        }
        
        for i in 1...7{
            DispatchQueue.main.asyncAfter(deadline: .now() + times[i]) {[self] in
                if self.player!.isPlaying {
                    self.player?.stop()
                    self.player2?.stop()
                    self.player3?.stop()
                    self.player?.currentTime = 0
                    self.player2?.currentTime = 0
                    self.player3?.currentTime = 0
                }
                self.playSound2(path:path, url:url[i], url2:url2[i], url3:url3[i],
                       melody1:melody1[i], melody2:melody2[i], melody3:melody3[i], sound_kazu:sound_kazu[i])
            }
        }
    }
        
    func playSound2(path: [String], url: URL, url2: URL, url3: URL,
                    melody1: String, melody2: String, melody3: String, sound_kazu: Int) {
        
        if sound_kazu == 3{
            melody1_text.text = melody1
            melody2_text.text = melody2
            melody3_text.text = melody3
            
            player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player2 = try? AVAudioPlayer(contentsOf: url2, fileTypeHint: AVFileType.mp3.rawValue)
            player3 = try? AVAudioPlayer(contentsOf: url3, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
            player2?.play()
            player3?.play()
        }
        
        if sound_kazu == 2{
            melody1_text.text = melody1
            melody2_text.text = melody2
            melody3_text.text = ""
            
            player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player2 = try? AVAudioPlayer(contentsOf: url2, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
            player2?.play()
        }
        
        if sound_kazu == 1{
            melody1_text.text = melody1
            melody2_text.text = ""
            melody3_text.text = ""
            
            player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
        }
    }
    
    
    func playSound() {
        let path = "/Users/e165712/Desktop/swift_project/random_piano/random_piano/魔王魂  ピアノ2-1ド.mp3"
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
