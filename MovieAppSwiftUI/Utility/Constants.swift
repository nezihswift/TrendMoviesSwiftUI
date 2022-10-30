//
//  Constants.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 27.10.2022.
//

import Foundation

class Constants {
    struct URL {
        static let popular = "https://api.themoviedb.org/3/movie/popular?api_key=\(API.apiKey)&language=\(API.languageLocale)&page=\(API.pageValue)"
        static let topRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(API.apiKey)&language=\(API.languageLocale)&page=\(API.pageValue)"
        static let baseImageURL = "https://image.tmdb.org/t/p/"
    }
    
    struct API {
        static let apiKey = "cfe7f8752acca72aa2075de691b9482c"
        static let languageLocale = "en_US"
        static let pageValue = 1
        static let rParameter = "r"
        static let json = "json"
        static let logoSizeThumbnail = "w92"
        static let logoSizeLarge = "w500"
    }
}
