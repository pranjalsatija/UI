//
//  DataSource.swift
//  UI
//
//  Created by Pranjal Satija on 1/27/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class DataSource: NSObject {
    private var views = [UIView]() {
        didSet {
            tableView?.reloadData()
        }
    }

    weak private var tableView: UITableView?

    public init(_ views: [UIView]) {
        self.views = views
    }
}

extension DataSource {
    public func append(_ view: UIView) {
        views.append(view)
    }

    public func insert(_ view: UIView, after otherView: UIView) {
        for (index, existingView) in views.enumerated() {
            if existingView == otherView {
                insert(view, at: index.advanced(by: 1))
            }
        }
    }

    public func insert(_ view: UIView, at index: Int) {
        views.insert(view, at: index)
    }

    public func bind(to tableView: UITableView) {
        self.tableView = tableView

        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.reloadData()
    }
}

extension DataSource: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return views.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContainerCell()
        cell.view = views[indexPath.row]
        return cell
    }
}
