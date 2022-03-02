//
//  PeopleViewModel.swift
//  CiceTmdbApp
//
//  Created by CICE on 02/03/2022.
//

import Foundation

struct PeopleViewModel: Identifiable {
    
    let id: Int?
    let knownFor: [KnownForViewModel]?
    let name: String?
    let profilePath: String?
    
    var profilePathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")!
    }
    
}

// MARK: - KnownFor
struct KnownForViewModel: Identifiable {

    let id: Int?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let originalTitle: String?
    let releaseDate: String?
    
    var posterPathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var yearText: String {
        guard let releaseDateUnw = releaseDate, let dateUnw = Utils.dateFormatter.date(from: releaseDateUnw) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: dateUnw)
    }

}
