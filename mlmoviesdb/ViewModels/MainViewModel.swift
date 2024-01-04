//
//  MainViewModel.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 29/12/2023.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        
        5
    }
    
    func fetchData() async {
        
        do {
            let trendingMovies = try await APICaller.getTrendingMovies()
            // Handle successful result here (e.g., update the UI, store data, etc.)
            print("* Original tilte of movie -> \(trendingMovies.results[0].originalTitle!)")
            
        } catch {
            // Handle error here (e.g., show an alert)
            if let networkError = error as? NetworkError {
                print(networkError.customMessage)
            } else {
                print(error)
            }
            
        }
    }
}

