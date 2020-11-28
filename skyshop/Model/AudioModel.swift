//
//  AudioModel.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import Foundation
import AVFoundation

class AudioModel : ObservableObject {
    static let shared = AudioModel()
    var bgAudioPlayer: AVAudioPlayer?
    var fgAudioPlayer: [AVAudioPlayer] = []
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "bgloop", ofType: "wav")!)
        do {
            bgAudioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            bgAudioPlayer!.numberOfLoops = -1
            bgAudioPlayer!.prepareToPlay()
            bgAudioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
    
    func playNote() {
        let notes = ["A#3", "D4", "D#3", "C3", "G4", "G2", "F4"]
        
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: notes.randomElement(), ofType: "wav")!)
        do {
            fgAudioPlayer.append(try AVAudioPlayer(contentsOf:aSound as URL))
            fgAudioPlayer.last!.setVolume(0.4, fadeDuration: 0.0)
            fgAudioPlayer.last!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
