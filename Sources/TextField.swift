//
//  RoundedTextField.swift
//  App
//
//  Created by Pranjal Satija on 1/21/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//



@IBDesignable
open class TextField: UITextField {
    @IBInspectable open var horizontalPadding: CGFloat = 0
    @IBInspectable open var placeholderColor: UIColor? {
        didSet {
            configureAttributedPlaceholder()
        }
    }

    @IBInspectable open var verticalPadding: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        performSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        performSetup()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        performSetup()
    }
}

extension TextField {
    open func showError(message: String) {
        let placeholderColor = self.placeholderColor
        let placeHolderText = placeholder

        self.placeholderColor = .error
        self.placeholder = message
        self.text = ""
        configureAttributedPlaceholder()

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {(_) in
            self.placeholderColor = placeholderColor
            self.placeholder = placeHolderText
            self.configureAttributedPlaceholder()
        }
    }
}

extension TextField {
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + horizontalPadding,
                      y: bounds.origin.y + verticalPadding,
                      width: bounds.width - horizontalPadding * 2,
                      height: bounds.height - horizontalPadding * 2)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

extension TextField {
    private func configureAttributedPlaceholder() {
        guard let text = placeholder, let color = placeholderColor else {
            return
        }

        attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: color])
    }

    private func performSetup() {
        layer.cornerRadius = 5
    }
}
