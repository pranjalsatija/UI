//
//  RaisedVisualEffectView.swift
//  App
//
//  Created by Pranjal Satija on 1/25/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//



@IBDesignable
open class RaisedVisualEffectView: UIVisualEffectView {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        performSetup()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        performSetup()
    }

    open func performSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
    }
}
