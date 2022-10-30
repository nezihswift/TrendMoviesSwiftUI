//
//  MovieAPI.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 25.10.2022.
//

import Foundation
import Alamofire

typealias MovieAPIPopularResponse = (Swift.Result<[Movie]?, DataError>) -> Void
typealias MovieAPITopRatedResponse = (Swift.Result<[MovieRating]?, DataError>) -> Void

protocol MovieAPILogic {
    func getPopularMovies(completion: @escaping (MovieAPIPopularResponse))
    func getTopRatedMovies(completion: @escaping (MovieAPITopRatedResponse))
}

class MovieAPI : MovieAPILogic {
    func getPopularMovies(completion: @escaping (MovieAPIPopularResponse)) {
        URLCache.shared.removeAllCachedResponses()
        AF.request(Constants.URL.popular,
                   method: .get,
                   encoding: URLEncoding.default)
        .validate()
        .responseDecodable(of: MovieRootResult.self ) { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(.networkingError(error.localizedDescription)))
            case .success(let movieListResult):
                completion(.success(movieListResult.movies))
            }
        }
    }
    
    func getTopRatedMovies(completion: @escaping (MovieAPITopRatedResponse)) {
        URLCache.shared.removeAllCachedResponses()
        print(Constants.URL.topRated)
        AF.request(Constants.URL.topRated,
                   method: .get,
                   encoding: URLEncoding.default)
        .validate()
        .responseDecodable(of: TopRatedMovieRootResult.self ) { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(.networkingError(error.localizedDescription)))
            case .success(let movieListResult):
                completion(.success(movieListResult.topRatedMovies))
            }
        }
    }
}
