//
//  MovieViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 25.10.2022.
//

import Foundation
import Combine

class MovieViewModel : ObservableObject {
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: DataError? = nil
    
    private let apiService: MovieAPILogic
    
    init(apiService: MovieAPILogic = MovieAPI()) {
        self.apiService = apiService
    }
    
    func getMovies() {
        print("Getting movies")
        apiService.getMovies() { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies ?? []
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
