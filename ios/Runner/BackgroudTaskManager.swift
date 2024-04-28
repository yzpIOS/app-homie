//
//  BackgroudTaskManager.swift
//  Runner
//
//  Created by 向飞 on 2024/4/26.
//

import Foundation
import UIKit
import AVFoundation

class BackgroudTaskManager: NSObject, AVAudioPlayerDelegate {
    static let sharedManager = BackgroudTaskManager()

    private var bgTask: UIBackgroundTaskIdentifier = .invalid
    private var player: AVAudioPlayer?
    private var timer: Timer?
    private let queue = DispatchQueue(label: "com.audio.background")
    private var runloopRef: CFRunLoop?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func appWillEnterForeground() {
        print("\(type(of: self)) appWillEnterForeground")
        stopKeepRunAlive()
    }

    @objc private func appDidEnterBackground() {
        print("\(type(of: self)) appDidEnterBackground")
        startKeepAlive()
    }

    func setup() {
        setupAudioSession()
        setupPlayer()
        addNotificationObservers()
    }

    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setMode(.default)
            
            let route = audioSession.currentRoute.outputs.first?.portType
            
            let options: AVAudioSession.CategoryOptions = [.mixWithOthers, .allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker]
            if route == .headphones || route == .bluetoothA2DP || route == .bluetoothLE || route == .bluetoothHFP {
                try audioSession.setCategory(.playAndRecord, options: options)
            } else {
                try audioSession.setCategory(.playAndRecord, options: options)
            }
            
            try audioSession.setActive(true)
        } catch {
            print("Error activating AVAudioSession: \(error)")
        }
    }
    
    private func setupPlayer() {
        guard let filePath = Bundle.main.path(forResource: "live_empty_music", ofType: "mp3"),
              let fileURL = URL(string: filePath) else {
            print("Failed to find the music file.")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: fileURL)
            player?.prepareToPlay()
            player?.volume = 0.4
            player?.numberOfLoops = -1
        } catch {
            print("Failed to initialize the audio player: \(error)")
        }
    }
    
    private func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }

    private func startKeepAlive() {
        player?.play()
        applyForBackgroundTask()
        queue.async {
            self.timer = Timer(fire: Date(), interval: 10, repeats: true) { _ in
                self.startAudioPlay()
            }
            self.runloopRef = CFRunLoopGetCurrent()
            RunLoop.current.add(self.timer!, forMode: .default)
            CFRunLoopRun()
        }
    }

    private func stopKeepRunAlive() {
        if let timer = timer {
            CFRunLoopStop(runloopRef)
            timer.invalidate()
            self.timer = nil
            player?.stop()
        }
        
        if bgTask != .invalid {
            UIApplication.shared.endBackgroundTask(bgTask)
            bgTask = .invalid
        }
    }

    private func applyForBackgroundTask() {
        bgTask = UIApplication.shared.beginBackgroundTask {
            DispatchQueue.main.async {
                if self.bgTask != .invalid {
                    UIApplication.shared.endBackgroundTask(self.bgTask)
                    self.bgTask = .invalid
                }
            }
        }
    }

    @objc private func startAudioPlay() {
        DispatchQueue.main.async {
            if UIApplication.shared.backgroundTimeRemaining < 31 {
                self.player?.play()
                self.applyForBackgroundTask()
            } else {
                self.player?.stop()
            }
        }
    }
}

