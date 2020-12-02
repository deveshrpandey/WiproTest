//
//  Protocol.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 12/1/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation

protocol CanadaInfoDataSource: class {
    func getCanadaInfoData(data:[CanadaInfoRow], title:String) -> Void
    func dataErrorInfo(errorInfo:String) -> Void
}
