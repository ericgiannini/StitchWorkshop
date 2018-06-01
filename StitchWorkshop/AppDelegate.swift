//
//  AppDelegate.swift
//  StitchWorkshop
//
//  Created by Shams Ahmed on 31/05/18.
//  Copyright © 2018 Nexmo. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK:
    // MARK: UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // As the method describes, ask user for audio permission
        askForAudioPermission()

        return true
    }

    // MARK:
    // MARK: Permission

    private func askForAudioPermission() {
        print("Demo - Asking for audio permission")

        do {
            let session = AVAudioSession.sharedInstance()

            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.setMode(AVAudioSessionModeVoiceChat)

            session.requestRecordPermission {
                if $0 {
                    print("Demo - Audio permission granted")
                } else {
                    print("Demo - Audio permission failed")
                }
            }
        } catch let error {
            print("Demo - Audio error: \(error.localizedDescription)")
        }
    }
}
