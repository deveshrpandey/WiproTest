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
    /// for Refreshing the data and loading into table view
    let refreshControl = UIRefreshControl()
    /// Data for populating table view
    private var arrDataInfo: [CanadaInfoRow] = []
     let canadaViewModel = CanadaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.title
        self.setupTableView()
        self.setUpRefreshView()
        canadaViewModel.delegate = self
        ///Call the API and populate the TableView
        canadaViewModel.getDataFromAPI()
    }
    /// Pull to refresh data in tableview
    @objc func refreshTableViewData(_ sender: UIRefreshControl)
    {
        canadaViewModel.getDataFromAPI()
        self.refreshControl.endRefreshing()
    }
}
///------ Tableview Data Source Method
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
/// CanadaInfoDataSource Method
extension CanadaInfoViewController : CanadaInfoDataSource
{/// Show pop up if an error occured
    func dataErrorInfo(errorInfo: String) {
        self.popupAlert(title: errorInfo, message: Constants.notFound, actionTitles: [Constants.ok], actions: [nil])
    }
    /// Get the data and update table view
    func getCanadaInfoData(data: [CanadaInfoRow], title:String) {
        self.title = title
        self.arrDataInfo = []
        self.arrDataInfo = data
        self.tableView.reloadData()
    }
    
}
