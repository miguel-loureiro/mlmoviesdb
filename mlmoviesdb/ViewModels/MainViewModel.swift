//
//  MainViewModel.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 29/12/2023.
//

import Foundation

class MainViewModel {

    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?

    func numberOfSections() -> Int {
        
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        
        return self.dataSource?.results.count ?? 0
    }
    
    func getData() async {

        if isLoading.value ?? true {

            return
        }

        isLoading.value = true

        do {
            let data = try await APICaller.getTrendingMovies()
            self.isLoading.value = false
            // Handle successful result here (e.g., update the UI, store data, etc.)
            print("* Top trending counts: \(data.results.count)")
            self.dataSource = data
            self.mapCellData()

        } catch {
            // Handle error here (e.g., show an alert)
            if let networkError = error as? NetworkError {
                print(networkError.customMessage)
            } else {
                print(error)
            }
            
        }
    }

    func mapCellData() {

        self.cellDataSource.value = self.dataSource?.results.compactMap( {MovieTableCellViewModel(movie: $0) })
    }

    func getMovieTitle(_ movie: Movie) -> String {

        return movie.title ?? movie.name ?? ""
    }
}

