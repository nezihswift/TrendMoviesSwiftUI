//
//  ContentView.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 24.10.2022.
//

import SwiftUI
import Charts

struct MovieView: View {
    @EnvironmentObject var viewModel : MovieViewModel
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            List {
                ForEach(viewModel.popularMovies) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)){
                        MovieCardView(movie: movie)
                    }
                }
            }
            .tag(1)
            .onAppear() {
                viewModel.getPopularMovies()
            }
            .tabItem{
                Label("Popular", systemImage: "popcorn.fill")
            }
            ScrollView {
                Chart {
                    ForEach(viewModel.topRatedMovies) { movie in
                        BarMark(x:.value("Vote Count", movie.voteAverage) , y: .value("Movies", movie.title))
                    }
                }
                .scaledToFill()
                .chartXScale(domain: 7...9)
                .chartXAxis {
                    AxisMarks(preset: .automatic, position: .top)
                }
            }
            .padding()
            .tag(2)
            .onAppear() {
                viewModel.getTopRatedMovies()
            }
            .tabItem{
                Label("Top Rated", systemImage: "chart.bar.fill")
            }
        }
        .navigationTitle(selection == 1 ? "Popular Movies" : "Top Rated Movies")
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .environmentObject(MovieViewModel())
    }
}
