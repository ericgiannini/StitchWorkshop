//
//  ViewController.swift
//  StitchWorkshop
//
//  Created by Shams Ahmed on 31/05/18.
//  Copyright © 2018 Nexmo. All rights reserved.
//

import UIKit
// TODO: STEP 1
import Stitch

class ViewController: UIViewController {

    @IBOutlet private var textfield: UITextField!

    // TODO: STEP 2
    private var call: Call?

    // MARK:
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: STEP 3
        ConversationClient.configuration = Configuration.init(with: .info)
        ConversationClient.instance
            .login(with: "JWT_TOKEN")
            .subscribe()
    }

    // MARK:
    // MARK: Action

    @IBAction
    func makeCall() {
        guard let number = textfield.text else { return }

        // TODO: STEP 4
        ConversationClient.instance.media.callPhone(number, onSuccess: { result in
            self.call = result.call

            print("DEMO - Created call")
        }) { error in
            print("DEMO - Failed to make call: \(error)")
        }
    }

    @IBAction
    func hangup() {
        // TODO: STEP 5
        call?.hangUp(onSuccess: {
            print("DEMO - Hangup call successful")
        })
    }
}
