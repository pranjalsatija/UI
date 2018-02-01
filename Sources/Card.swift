//
//  Card.swift
//  App
//
//  Created by Pranjal Satija on 1/26/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

open class Card: ContainerView {
    open override func performSetup() {
        super.performSetup()
        layer.cornerRadius = 22
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
    }
}
