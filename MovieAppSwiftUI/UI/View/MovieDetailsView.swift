//
//  MovieDetailsView.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 27.10.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                let url = URL(string: movie.getLargeImageURL())
                WebImage(url: url)
                    .resizable()
                    .scaledToFit()
                
                .padding()
                if movie.releaseDate != "" {
                    Text("Released: \(movie.releaseDate)")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                else {
                    Text("Not Released")
                }
                if let imdbValue : String = movie.voteAverage.description {
                    Text("IMDB: \(imdbValue)")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                }
                Text(movie.overview)
                    .padding()
            }
            .accessibilityLabel("Movie Details")
            .navigationTitle(movie.title)
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
            .padding()
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(id: 1, title: "John Wick", releaseDate: "1998-15-08", imageURLSuffix: "/e1mjopzAS2KNsvpbpahQ16SkSn.jpg", overview: "John Wick the movie this is a empty text. I'm writing some empty stuff that I dont want to.", voteAverage: 7.7))
    }
}
