//
//  ContainerCell.swift
//  UI
//
//  Created by Pranjal Satija on 1/29/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

class ContainerCell: UITableViewCell {
    static let reuseIdentifier = "ContainerCell"


    var view: UIView! {
        didSet {
            oldValue?.removeFromSuperview()
            configureLayout()
        }
    }
}

extension ContainerCell {
    fileprivate func configureLayout() {
        guard let view = view else { return }

        backgroundColor = .clear
        contentView.addSubview(view)

        view.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
