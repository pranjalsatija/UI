//
//  DataSource.swift
//  UI
//
//  Created by Pranjal Satija on 1/27/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public class DataSource: NSObject {
    public var sections: [Section] {
        didSet {

        }
    }

    public init(sections: [Section]) {
        self.sections = sections
    }
}

extension DataSource {
    public func bind(to tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
}

extension DataSource: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
