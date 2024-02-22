//
//  CachedDefaultConfig.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 22/02/2024.
//

import Foundation

extension URLSession {

    static func defaultConfig()  -> URLSession {

        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }
}
