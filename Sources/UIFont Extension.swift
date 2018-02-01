//
//  UIFont Extension.swift
//  UI
//
//  Created by Pranjal Satija on 1/31/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

extension UIFont {
    var boldVersion: UIFont? {
        let boldTraits: UIFontDescriptorSymbolicTraits = [fontDescriptor.symbolicTraits, .traitBold]
        if let boldDescriptor = fontDescriptor.withSymbolicTraits(boldTraits) {
            return UIFont(descriptor: boldDescriptor, size: pointSize)
        } else {
            return nil
        }
    }
}
