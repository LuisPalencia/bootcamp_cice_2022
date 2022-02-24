//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by CICE on 22/02/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List{ 
            Group{
                if !self.viewModel.dataSourceNowPlaying.isEmpty{
                    MoviesPosterCarrousel(title: "Now playing", moviesModel: self.viewModel.dataSourceNowPlaying, isPoster: false)
                }
            }
            Group{
                if !self.viewModel.dataSourcePopular.isEmpty{
                    MoviesPosterCarrousel(title: "Popular", moviesModel: self.viewModel.dataSourcePopular, isPoster: true)
                }
            }
            Group{
                if !self.viewModel.dataSourceTopRated.isEmpty{
                    MoviesPosterCarrousel(title: "Top rated", moviesModel: self.viewModel.dataSourceTopRated, isPoster: false)
                }
            }
            Group{
                if !self.viewModel.dataSourceUpcoming.isEmpty{
                    MoviesPosterCarrousel(title: "Upcoming", moviesModel: self.viewModel.dataSourceUpcoming, isPoster: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Movies"))
        .onAppear(perform: {
            self.viewModel.fetchData()
        })
        
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesViewModel())
    }
}
