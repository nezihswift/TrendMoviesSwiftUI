//
//  Movie.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 25.10.2022.
//

import Foundation

struct MovieRootResult: Codable {
    let page: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
    }
}

struct Movie: Codable, Identifiable {
    var id: Int
    let title: String
    let releaseDate: String
    let imageURLSuffix: String
    let overview: String
    let voteAverage : Double
    
    func getThumbnailImageURL() -> String {
        "\(Constants.URL.baseImageURL)\(Constants.API.logoSizeThumbnail)\(imageURLSuffix)"
    }
    func getLargeImageURL() -> String {
        "\(Constants.URL.baseImageURL)\(Constants.API.logoSizeLarge)\(imageURLSuffix)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case overview
        case imageURLSuffix = "poster_path"
        case voteAverage = "vote_average"
    }
}
