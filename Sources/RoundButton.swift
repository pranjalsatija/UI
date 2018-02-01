//
//  RoundButton.swift
//  App
//
//  Created by Pranjal Satija on 1/23/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

@IBDesignable
open class RoundButton: Button {
    @IBInspectable open var roundsSuperview: Bool = false {
        didSet {
            performSetup()
        }
    }

    open override func performSetup() {
        if roundsSuperview {
            superview!.clipsToBounds = true
            superview!.layer.cornerRadius = min(superview!.frame.width, superview!.frame.height) / 2
        }

        layer.cornerRadius = min(frame.width, frame.height) / 2
    }
}
