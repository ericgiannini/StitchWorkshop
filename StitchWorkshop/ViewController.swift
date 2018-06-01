//
//  ViewController.swift
//  StitchWorkshop
//
//  Created by Shams Ahmed on 31/05/18.
//  Copyright © 2018 Nexmo. All rights reserved.
//

import UIKit
import Stitch

class ViewController: UIViewController {

    @IBOutlet private var textfield: UITextField!
    @IBOutlet private var call: UIButton!

    // MARK:
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // logs
        ConversationClient.configuration = Configuration.init(with: .info)

        // Login to Stitch services
        ConversationClient.instance
            .login(with: "TOKEN")
            .subscribe()
    }

    // MARK:
    // MARK: Action

    @IBAction
    func makeCall() {
        guard let number = textfield.text else {
            print("DEMO - No number")

            return
        }

        ConversationClient.instance.media.callPhone(number, onSuccess: { result in
            let call = result.call

            print("DEMO - Created call: \(call)")
        }) { error in
            print("DEMO - Failed to make call: \(error)")
        }
    }
}
