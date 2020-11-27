//
//  CanadaInfoViewController.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import UIKit

class CanadaInfoViewController: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let refreshControl = UIRefreshControl()// for Refreshing the data and loading into table view
    private var arrDataInfo: [CanadaInfoRow] = [] // Data for populating table view
    private let infoApi = CanadaInfoServiceCall(_httpUtility:httpUtility()) // for hitting the API and populating table view after getting the data from server
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.title
        safeArea = view.layoutMarginsGuide
        setupTableView()
        setUpRefreshView()
        serviceCallForPopulateTable()
    }
    
    // Setting and implementin refresh view
    func setUpRefreshView() {
        refreshControl.attributedTitle = NSAttributedString(string: Constants.refresh)
        refreshControl.backgroundColor = .cyan
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    //SetUp and Cofigure Table View
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(CanadaInfoCell.self, forCellReuseIdentifier: CanadaInfoCell.className)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    // Function for service call, getting and populating data in table view
    func serviceCallForPopulateTable() {
        infoApi.callAPIWithNewSession { [weak self] (result) in
            guard let self = self else { return }
            guard let data = result.rows
            else
            {
                self.popupAlert(title: Constants.alert, message: Constants.notFound, actionTitles: [Constants.ok], actions: [nil])
                return
            }
            self.title = result.title ?? Constants.title
            self.arrDataInfo = []
            self.arrDataInfo = data
            self.tableView.reloadData()
        }
    }
    // Pull to refresh data in tableview
    @objc func refresh(_ sender: UIRefreshControl)
    {
        serviceCallForPopulateTable()
        self.refreshControl.endRefreshing()
    }
}

//------ Tableview Data Source Method
extension CanadaInfoViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CanadaInfoCell.className, for: indexPath) as! CanadaInfoCell
        cell.info = arrDataInfo[indexPath.row]
        return cell
    }
}
