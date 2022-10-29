//
//  MovieAPI.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 25.10.2022.
//

import Foundation
import Alamofire

typealias MovieAPIResponse = (Swift.Result<[Movie]?, DataError>) -> Void

protocol MovieAPILogic {
    func getMovies(completion: @escaping (MovieAPIResponse))
}

class MovieAPI : MovieAPILogic {
    func getMovies(completion: @escaping (MovieAPIResponse)) {
        URLCache.shared.removeAllCachedResponses()
        print(Constants.URL.requestURL)
        AF.request(Constants.URL.requestURL,
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
}
