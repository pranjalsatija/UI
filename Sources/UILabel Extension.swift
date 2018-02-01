//
//  UILabel Extension.swift
//  UI
//
//  Created by Pranjal Satija on 1/31/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public extension UILabel {
    func boldSubstring(_ string: String) {
        guard let attributedText = attributedText, let text = text, let range = text.range(of: string), let boldFont = font.boldVersion else {
            return
        }

        let nsRange = NSRange(range, in: text)
        let newAttributedText = NSMutableAttributedString(attributedString: attributedText)
        newAttributedText.addAttribute(.font, value: boldFont, range: nsRange)
        self.attributedText = newAttributedText
    }
}
