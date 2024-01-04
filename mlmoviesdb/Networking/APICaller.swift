//
//  APICaller.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 30/12/2023.
//

import Foundation
import UIKit

    public class APICaller {

        static func getTrendingMovies() async throws -> TrendingMovieModel {

            try checkAPIKey()

            var urlComponents = URLComponents(string: NetworkConstant.shared.serverAddress + "trending/all/day")
            urlComponents?.queryItems = [URLQueryItem(name: "api_key", value: NetworkConstant.shared.apiKey)]

            guard let url = urlComponents?.url else {
                throw NetworkError.invalidURL            }

            print("🍓\(url)")
            let (data, _) = try await URLSession.shared.data(from: url)

            do {
                return try JSONDecoder().decode(TrendingMovieModel.self, from: data)
            } catch {
                throw NetworkError.unableToParseData
            }

        }

        private static func checkAPIKey() throws {
            guard !NetworkConstant.shared.apiKey.isEmpty else {
                print("<!> API Key is Missing <!>")
                print("<!> Get One from: https://www.themoviedb.org/ <!>")
                throw NetworkError.invalidURL
            }
        }
    }
