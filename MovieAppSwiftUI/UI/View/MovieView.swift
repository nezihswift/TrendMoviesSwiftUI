//
//  ContentView.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 24.10.2022.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var viewModel : MovieViewModel
    var body: some View {
        List {
            Section(header:Text("Popular Movies")){
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)){
                        MovieCardView(movie: movie).frame(height: 100)
                    }
                }
            }
        }
        .navigationTitle("Movies")
        .onAppear() {
            viewModel.getMovies()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .environmentObject(MovieViewModel())
    }
}
