//
//  Colors.swift
//  App
//
//  Created by Pranjal Satija on 1/23/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public extension UIColor {
    static var activeIcon: UIColor {
        return UIColor.black.withAlphaComponent(0.87)
    }

    static var base: UIColor {
        return UIColor(red: 61 / 255, green: 167 / 255, blue: 255 / 255, alpha: 1)
    }

    static var error: UIColor {
        return UIColor(red: 217 / 255, green: 69 / 255, blue: 61 / 255, alpha: 1)
    }

    static var like: UIColor {
        return UIColor(red: 233 / 255, green: 76 / 255, blue: 90 / 255, alpha: 1)
    }

    static var inactiveIcon: UIColor {
        return UIColor.black.withAlphaComponent(0.5)
    }

    static var primaryText: UIColor {
        return UIColor.black.withAlphaComponent(0.87)
    }
}
