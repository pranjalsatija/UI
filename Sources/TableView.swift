//
//  TableView.swift
//  UI
//
//  Created by Pranjal Satija on 1/31/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class TableView: UITableView {
    @IBInspectable public var emptyMessage: String?

    private var emptyMessageLabel: UILabel!
    private var refreshIndicator: UIRefreshControl!
    private var onRefreshBlock: ((@escaping () -> Void) -> Void)!
}

extension TableView {
    public func showEmptyState() {
        guard let emptyMessage = emptyMessage else {
            return
        }

        emptyMessageLabel?.removeFromSuperview()
        emptyMessageLabel = UILabel(frame: frame)
        emptyMessageLabel.backgroundColor = backgroundColor
        emptyMessageLabel.font = .bodyEmphasized
        emptyMessageLabel.numberOfLines = 0
        emptyMessageLabel.text = emptyMessage
        emptyMessageLabel.textAlignment = .center
        emptyMessageLabel.textColor = .primaryText

        isHidden = true
        superview?.addSubview(emptyMessageLabel)
    }

    public func hideEmptyState() {
        emptyMessageLabel.removeFromSuperview()
        isHidden = false
    }
}

extension TableView {
    public func onRefresh(_ block: @escaping (@escaping () -> Void) -> Void) {
        onRefreshBlock = block
        refreshIndicator = UIRefreshControl()
        refreshIndicator.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshIndicator.tintColor = UIColor.activeIcon
        addSubview(refreshIndicator)
    }

    @objc private func refresh() {
        onRefreshBlock({
            self.refreshIndicator.endRefreshing()
        })
    }
}
