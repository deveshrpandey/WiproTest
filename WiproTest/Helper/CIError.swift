//
//  FSError.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation

enum CIError: Error {
    case invalidArguments
    case invalidResponse
    case unknownResponse
}
extension CIError: LocalizedError {
    public var errorDescription: String? {
        get {
            switch self {
            case .invalidArguments:
                return Constants.invalidArguments
            case .invalidResponse:
                return Constants.invalidResponse
            default:
                return Constants.UnknownError
            }
        }
    }
}
