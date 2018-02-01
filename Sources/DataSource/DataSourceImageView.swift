//
//  DataSourceImageView.swift
//  UI
//
//  Created by Pranjal Satija on 1/30/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class DataSourceImageView: UIView {
    public var imageView: UIImageView!
    
    private var tapHandler: ((DataSourceImageView) -> Void)?
}

public extension DataSourceImageView {
    static func make(image: UIImage, contentMode: UIViewContentMode, maxHeight: CGFloat? = nil, padding: CGFloat = 16,
                     imageColor: UIColor? = nil, tapHandler: ((DataSourceImageView) -> Void)? = nil) -> DataSourceImageView {

        let dataSourceImageView = DataSourceImageView()
        dataSourceImageView.configureImageView(image: image, contentMode: contentMode, maxHeight: maxHeight, padding: padding,
                                               imageColor: imageColor)

        if let tapHandler = tapHandler {
            dataSourceImageView.configureGestureRecognizer(tapHandler: tapHandler)
        }

        return dataSourceImageView
    }
}

private extension DataSourceImageView {
    func configureImageView(image: UIImage, contentMode: UIViewContentMode, maxHeight: CGFloat?, padding: CGFloat, imageColor: UIColor?) {
        imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.contentMode = contentMode

        if let imageColor = imageColor {
            imageView.image = image.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = imageColor
        } else {
            imageView.image = image.withRenderingMode(.alwaysOriginal)
        }

        imageView.sizeToFit()
        addSubview(imageView!)

        imageView!.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(padding)
            $0.bottom.equalTo(self.snp.bottom).offset(-padding)
            $0.left.equalTo(self.snp.left).offset(padding)
            $0.right.equalTo(self.snp.right).offset(-padding)

            if let maxHeight = maxHeight {
                $0.height.lessThanOrEqualTo(maxHeight).priority(999)
            }
        }
    }

    func configureGestureRecognizer(tapHandler: @escaping (DataSourceImageView) -> Void) {
        self.tapHandler = tapHandler

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(gestureRecognizer)
    }
}

private extension DataSourceImageView {
    @objc func tapped() {
        tapHandler?(self)
    }
}
