//
//  MovieAppSwiftUIApp.swift
//  MovieAppSwiftUI
//
//  Created by Nezih on 24.10.2022.
//

import SwiftUI

@main
struct MovieAppSwiftUIApp: App {
    let viewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MovieView()
                    .environmentObject(viewModel)
            }
        }
    }
}
