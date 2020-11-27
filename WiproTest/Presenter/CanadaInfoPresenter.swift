//
//  CanadaInfoPresenter.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation
import UIKit
struct CanadaInfoServiceCall
{
    private let httpUtilitySession: httpUtility
    init(_httpUtility: httpUtility) {
        httpUtilitySession = _httpUtility
    }
    func callAPIWithNewSession(completed:@escaping (_ post:CanadaInfoModel) -> Void)
    {
        httpUtilitySession.CallAPIwithSession(resultType: CanadaInfoModel.self) { (result) in
            completed(result)
        }
    }
}
