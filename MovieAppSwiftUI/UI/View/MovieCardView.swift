//
//  MovieCardView.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 27.10.2022.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
    var movie: Movie
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                Spacer()
                Text("IMDB: \(movie.voteAverage.description)")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
            }
            Spacer()
            let url = URL(string: movie.getThumbnailImageURL())
            WebImage(url: url)
                .resizable()
                .scaledToFit()
        }
        .frame(height: 100)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: Movie(id: 1, title: "John Wick", releaseDate: "1998-15-08", imageURLSuffix: "some.jpg", overview: "John Wick the movie this is a empty text. I'm writing some empty stuff that I dont want to.",voteAverage: 4.4))
    }
}
