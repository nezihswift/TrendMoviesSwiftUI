//
//  MovieViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 25.10.2022.
//

import Foundation
import Combine

class MovieViewModel : ObservableObject {
    @Published private(set) var popularMovies: [Movie] = []
    @Published private(set) var topRatedMovies: [MovieRating] = []
    @Published private(set) var error: DataError? = nil
    
    private let apiService: MovieAPILogic
    
    init(apiService: MovieAPILogic = MovieAPI()) {
        self.apiService = apiService
    }
    
    func getPopularMovies() {
        apiService.getPopularMovies() { [weak self] result in
            switch result {
            case .success(let popularMovies):
                self?.popularMovies = popularMovies ?? []
            case .failure(let error):
                self?.error = error
            }
        }
    }
    
    func getTopRatedMovies() {
        apiService.getTopRatedMovies { [weak self] result in
            switch result {
            case .success(let topRatedMovies):
                self?.topRatedMovies = topRatedMovies ?? []
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
