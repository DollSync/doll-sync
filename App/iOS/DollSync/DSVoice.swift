//
//  DSVoice.swift
//  DollSync
//
//  Created by 文光石 on 2016/01/26.
//  Copyright © 2016年 Threees. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class DSVoice: NSObject, AVSpeechSynthesizerDelegate {
    
    var speaker: AVSpeechSynthesizer?
    
    override init() {
        super.init()
        
        self.speaker = AVSpeechSynthesizer()
        self.speaker?.delegate = self
    }
    
    func speachWord(word: String) {
        
        let utterance = AVSpeechUtterance(string: word)
        // same with system language
        //utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.pitchMultiplier = 1.1
        utterance.rate = 0.4
        self.speaker?.speakUtterance(utterance)
    }
    
    func speakWithFile(voiceFile: String) {
        let voiceUrl = NSURL(string: voiceFile)
        speakWithUrl(voiceUrl!)
    }
    
    func speakWithUrl(voiceUrl: NSURL) {
        do {
            let audioPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOfURL: voiceUrl)
            audioPlayer.play()
        } catch {
            
        }
    }
    
    func speakWithData(data: NSData) {
        do {
            let audioPlayer: AVAudioPlayer = try AVAudioPlayer(data: data)
            audioPlayer.play()
        } catch {
            
        }
    }
    
    // MARK: - AVSpeechSynthesizerDelegate protocol
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        print("speech start")
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        print("speech end")
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let word = (utterance.speechString as NSString).substringWithRange(characterRange)
        print("Speech: \(word)")
    }
}