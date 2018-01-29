//
//  Application.swift
//  UI
//
//  Created by Pranjal Satija on 1/28/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

extension UIApplication {
    public func openSettings() {
        let url = URL(string: UIApplicationOpenSettingsURLString)!
        open(url)
    }
}
