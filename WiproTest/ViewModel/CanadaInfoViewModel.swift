//
//  CanadaInfoPresenter.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation

class CanadaViewModel {
    private let infoApi = CanadaInfoServiceCall(_httpUtility:httpUtility())
   weak var delegate: CanadaInfoDataSource?
    
    func getDataFromAPI()
    {
        infoApi.callAPIWithNewSession { [weak self] (canadaData) in
            guard let self = self else { return }
            guard let data = canadaData.rows
            else
            {
                self.delegate?.dataErrorInfo(errorInfo: Constants.notFound)
                return
            }
            self.delegate?.getCanadaInfoData(data: data, title: canadaData.title)
        }
    }
    
}
