//
//  DataSourceTextView.swift
//  UI
//
//  Created by Pranjal Satija on 1/29/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class DataSourceTextView: UIView {
    private var accessoryImageView: UIImageView?
    private var iconImageView: UIImageView?
    private var textLabel: UILabel!
    private var tapHandler: ((DataSourceTextView) -> Void)?
}

public extension DataSourceTextView {
    static func make(text: String,
                     textColor: UIColor = .primaryText,
                     font: UIFont = .systemFont(ofSize: 14),
                     icon: UIImage? = nil,
                     iconColor: UIColor = .base,
                     accessoryImage: UIImage? = nil,
                     accessoryColor: UIColor = .inactiveIcon,
                     tapHandler: ((DataSourceTextView) -> Void)? = nil) -> DataSourceTextView {

        let dataSourceTextView = DataSourceTextView()

        if let icon = icon {
            dataSourceTextView.configureImageView(image: icon, color: iconColor)
        }

        if let tapHandler = tapHandler, let image = accessoryImage {
            dataSourceTextView.configureAccessoryImageView(icon: image, iconColor: accessoryColor)
            dataSourceTextView.configureGestureRecognizer(tapHandler: tapHandler)
        }

        dataSourceTextView.configureTextLabel(text: text, font: font, textColor: textColor)

        return dataSourceTextView
    }
}

private extension DataSourceTextView {
    func configureImageView(image: UIImage, color: UIColor) {
        iconImageView = UIImageView()
        iconImageView!.backgroundColor = .clear
        iconImageView!.clipsToBounds = true
        iconImageView!.contentMode = .center
        iconImageView!.image = image.withRenderingMode(.alwaysTemplate)
        iconImageView!.tintColor = color
        iconImageView!.sizeToFit()
        addSubview(iconImageView!)

        iconImageView!.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(16)
            $0.bottom.equalTo(self.snp.bottom).offset(-16)
            $0.left.equalTo(self.snp.left).offset(16)
            $0.width.equalTo(iconImageView!.frame.width)
        }
    }

    func configureTextLabel(text: String, font: UIFont, textColor: UIColor) {
        textLabel = UILabel()
        textLabel.backgroundColor = .clear
        textLabel.font = font
        textLabel.numberOfLines = 0
        textLabel.text = text
        textLabel.textColor = textColor
        addSubview(textLabel)

        textLabel.snp.makeConstraints {
            $0.centerY.equalTo(self).priority(999)
            $0.top.equalTo(self.snp.top).offset(16)
            $0.bottom.equalTo(self.snp.bottom).offset(-16)

            if let imageView = iconImageView {
                $0.left.equalTo(imageView.snp.right).offset(8)
            } else {
                $0.left.equalTo(self.snp.left).offset(16)
            }

            if let accessoryImageView = accessoryImageView {
                $0.right.equalTo(accessoryImageView.snp.left).offset(-16)
            } else {
                $0.right.equalTo(self.snp.right).offset(-16)
            }
        }
    }

    func configureAccessoryImageView(icon: UIImage, iconColor: UIColor) {
        accessoryImageView = UIImageView()
        accessoryImageView!.backgroundColor = .clear
        accessoryImageView!.clipsToBounds = true
        accessoryImageView!.contentMode = .center
        accessoryImageView!.image = icon.withRenderingMode(.alwaysTemplate)
        accessoryImageView!.tintColor = iconColor
        accessoryImageView!.sizeToFit()

        addSubview(accessoryImageView!)

        accessoryImageView!.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(16)
            $0.bottom.equalTo(self.snp.bottom).offset(-16)
            $0.right.equalTo(self.snp.right).offset(-16)
            $0.width.equalTo(accessoryImageView!.frame.width)
        }
    }

    func configureGestureRecognizer(tapHandler: @escaping (DataSourceTextView) -> Void) {
        self.tapHandler = tapHandler

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(gestureRecognizer)
    }
}

private extension DataSourceTextView {
    @objc func tapped() {
        tapHandler?(self)
    }
}
