//
//  DataSourceButtonView.swift
//  UI
//
//  Created by Pranjal Satija on 1/29/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class DataSourceButtonView: UIView {
    public var button: UIButton!
    
    private var tapHandler: ((DataSourceButtonView) -> Void)!
}

public extension DataSourceButtonView {
    static func make(text: String, textColor: UIColor = .base, tapHandler: @escaping (DataSourceButtonView) -> Void) -> DataSourceButtonView {
        let dataSourceButtonView = DataSourceButtonView()
        dataSourceButtonView.configureButton(text: text, textColor: textColor, tapHandler: tapHandler)
        return dataSourceButtonView
    }
}

private extension DataSourceButtonView {
    func configureButton(text: String, textColor: UIColor, tapHandler: @escaping (DataSourceButtonView) -> Void) {
        button = UIButton(type: .system)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        button.backgroundColor = .clear
        button.contentEdgeInsets = UIEdgeInsetsMake(16, 16, 16, 16)
        button.titleLabel?.font = .button
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        addSubview(button)

        button.snp.makeConstraints {
            $0.edges.equalTo(self)
        }

        self.tapHandler = tapHandler
    }
}

private extension DataSourceButtonView {
    @objc func tapped() {
        tapHandler(self)
    }
}
