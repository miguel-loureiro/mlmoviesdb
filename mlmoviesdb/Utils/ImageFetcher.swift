//
//  ImageFetcher.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 22/02/2024.
//

import Foundation
import UIKit

class ImageFetcher {

    public func get(url: URL?, session: URLSessionProtocol = URLSession.defaultConfig()) async throws -> UIImage? {

        guard let url = url else {
            return nil
        }
        let (data, _) = try await session.data(from: url)

        return UIImage(data: data)
    }
}
