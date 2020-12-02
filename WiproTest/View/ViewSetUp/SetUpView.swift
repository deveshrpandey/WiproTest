//
//  SetUpView.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 12/1/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation
import UIKit

extension CanadaInfoViewController
{
    // Setting and implementin refresh view
    func setUpRefreshView() {
        refreshControl.attributedTitle = NSAttributedString(string: Constants.refresh)
        refreshControl.backgroundColor = .cyan
        refreshControl.addTarget(self, action: #selector(self.refreshTableViewData(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    //SetUp and Cofigure Table View
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(CanadaInfoCell.self, forCellReuseIdentifier: CanadaInfoCell.className)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
