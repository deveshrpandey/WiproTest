//
//  WiproWebService.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation

struct httpUtility
{
    func CallAPIwithSession<T:Decodable>(resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void) -> Void
    {
        var request = URLRequest(url: URL(string: Constants.URL)!,timeoutInterval: Double.infinity)
        request.httpMethod = Constants.post
        print("URL:->\(Constants.URL)")
        SVProgressHUD.show()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? CIError.invalidResponse)
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                return }
            let response = String(data: data, encoding: String.Encoding.ascii)
            let rsponseData = response!.data(using: String.Encoding.utf8)
            if let result = try? JSONDecoder().decode(T.self, from: rsponseData!) {
               print("res", result)
                DispatchQueue.main.async {
                  SVProgressHUD.dismiss()
                    completionHandler(result)
                }
            } else {
                DispatchQueue.main.async{SVProgressHUD.dismiss()}
                print(error?.localizedDescription ?? CIError.invalidResponse)
            }
        }
        task.resume()
    }
    
}

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
