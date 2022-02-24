//
//  MoviesTVModelView.swift
//  CiceTmdbApp
//
//  Created by CICE on 24/02/2022.
//

import Foundation

struct MoviesTVModelView: Identifiable{
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let name: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    var backdropUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
}
