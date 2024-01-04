//
//  NetworkError.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 30/12/2023.
//

import Foundation

// MARK: Error types
public enum NetworkError: Error, Equatable {

    case invalidURL
    case unableToParseData

    var customMessage: String {
        switch self {
            case .invalidURL:
                return "Invalid url"
            case .unableToParseData:
                return "No data / wrong data"
        }
    }
}
