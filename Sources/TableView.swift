//
//  TableView.swift
//  UI
//
//  Created by Pranjal Satija on 1/31/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class TableView: UITableView {
    private var refreshIndicator: UIRefreshControl!
    private var onRefreshBlock: ((@escaping () -> Void) -> Void)!

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
