//
//  DetailPersonServerModel.swift
//  CiceTmdbApp
//
//  Created by CICE on 11/03/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailPersonServerModel = try? newJSONDecoder().decode(DetailPersonServerModel.self, from: jsonData)

import Foundation

// MARK: - DetailPersonServerModel
struct DetailPersonServerModel: Codable {
    let adult: Bool?
    let alsoKnownAs: [String]?
    let biography: String?
    let birthday: String?
    let deathday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let knownForDepartment: String?
    let name: String?
    let placeOfBirth: String?
    let popularity: Double?
    let profilePath: String?
    let movieCredits: MovieCredits?
    let tvCredits: TvCredits?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case alsoKnownAs = "also_known_as"
        case biography = "biography"
        case birthday = "birthday"
        case deathday = "deathday"
        case gender = "gender"
        case homepage = "homepage"
        case id = "id"
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case placeOfBirth = "place_of_birth"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case movieCredits = "movie_credits"
        case tvCredits = "tv_credits"
    }
    
    var profileUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")!
    }
    
    
}

// MARK: - MovieCredits
struct MovieCredits: Codable {
    let cast: [MovieCreditsCast]?
    let crew: [MovieCreditsCrew]?

    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
}

// MARK: - MovieCreditsCast
struct MovieCreditsCast: Codable, Identifiable {
    let overview: String?
    let releaseDate: String?
    let title: String?
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let posterPath: String?
    let voteCount: Int?
    let video: Bool?
    let id: Int?
    let voteAverage: Double?
    let popularity: Double?
    let character: String?
    let creditID: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case overview = "overview"
        case releaseDate = "release_date"
        case title = "title"
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case video = "video"
        case id = "id"
        case voteAverage = "vote_average"
        case popularity = "popularity"
        case character = "character"
        case creditID = "credit_id"
        case order = "order"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

// MARK: - MovieCreditsCrew
struct MovieCreditsCrew: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let popularity: Double?
    let creditID: String?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity = "popularity"
        case creditID = "credit_id"
        case department = "department"
        case job = "job"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

// MARK: - TvCredits
struct TvCredits: Codable {
    let cast: [TvCreditsCast]?
    let crew: [TvCreditsCrew]?

    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
}

// MARK: - TvCreditsCast
struct TvCreditsCast: Codable, Identifiable {
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
    let popularity: Double?
    let character: String?
    let creditID: String?
    let episodeCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity = "popularity"
        case character = "character"
        case creditID = "credit_id"
        case episodeCount = "episode_count"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

// MARK: - TvCreditsCrew
struct TvCreditsCrew: Codable, Identifiable {
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Int?
    let voteCount: Int?
    let popularity: Double?
    let creditID: String?
    let department: String?
    let episodeCount: Int?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity = "popularity"
        case creditID = "credit_id"
        case department = "department"
        case episodeCount = "episode_count"
        case job = "job"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

