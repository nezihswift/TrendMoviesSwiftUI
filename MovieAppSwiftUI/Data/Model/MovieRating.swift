//
//  TopRatedMovie.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 30.10.2022.
//

import Foundation

struct TopRatedMovieRootResult: Codable {
    let page: Int
    let topRatedMovies: [MovieRating]
    
    enum CodingKeys: String, CodingKey {
        case page
        case topRatedMovies = "results"
    }
}

struct MovieRating : Codable, Identifiable {
    let id: Int
    let title: String
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}


