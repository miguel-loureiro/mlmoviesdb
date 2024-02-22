//
//  URLSessionProtocol.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 22/02/2024.
//

import Foundation

protocol URLSessionProtocol {

    func data(from url: URL ) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
