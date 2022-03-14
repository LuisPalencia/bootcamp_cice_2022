// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailShowServerModel = try? newJSONDecoder().decode(DetailShowServerModel.self, from: jsonData)

import Foundation

// MARK: - DetailShowServerModel
struct DetailShowServerModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let createdBy: [CreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: TEpisodeToAir?
    let name: String?
    let nextEpisodeToAir: TEpisodeToAir?
    let networks: [Network]?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [Network]?
    let productionCountries: [ProductionCountry]?
    let seasons: [Season]?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let type: String?
    let voteAverage: Double?
    let voteCount: Int?
    let credits: Credits?
    let similar: SimilarShow?
    let videos: Videos?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name = "name"
        case nextEpisodeToAir = "next_episode_to_air"
        case networks = "networks"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons = "seasons"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case credits = "credits"
        case similar = "similar"
        case videos = "videos"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    var yearText: String {
        guard let firstAirDateUnw = firstAirDate, let dateUnw = Utils.dateFormatter.date(from: firstAirDateUnw) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: dateUnw)
    }
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (partialResult, _) -> String in
            return partialResult + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "N/A"
        }
        return "\(ratingText.count) / 10"
    }
    
    var cast: [Cast]? {
        credits?.cast
    }
    
    var crew: [Crew]? {
        credits?.crew
    }
    
    var directors: [Crew]? {
        crew?.filter{ $0.job?.lowercased() == "director" }
    }
    
    var producers: [Crew]? {
        crew?.filter{ $0.job?.lowercased() == "producer" }
    }
    
    var screenWriters: [Crew]? {
        crew?.filter{ $0.job?.lowercased() == "writer"}
    }
    
    var youtubeTrailers: [ResultVideo]? {
        videos?.results?.filter{ $0.youtubeURL != nil }
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let id: Int?
    let creditID: String?
    let name: String?
    let gender: Int?
    let profilePath: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case creditID = "credit_id"
        case name = "name"
        case gender = "gender"
        case profilePath = "profile_path"
    }
}

// MARK: - TEpisodeToAir
struct TEpisodeToAir: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let productionCode: String?
    let seasonNumber: Int?
    let stillPath: JSONNull?
    let voteAverage: Int?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Network
struct Network: Codable {
    let name: String?
    let id: Int?
    let logoPath: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}


// MARK: - Season
struct Season: Codable, Identifiable {
    let airDate: String?
    let episodeCount: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
    
    var posterPathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

// MARK: - Similar
struct SimilarShow: Codable {
    let page: Int?
    let results: [SimilarResultShow]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - SimilarResult
struct SimilarResultShow: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var posterPathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

extension DetailShowServerModel {
    
    static var stubbedDetailShow: DetailShowServerModel? {
        let response: DetailShowServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "DetailShow")
        if let responseUnw = response{
            return responseUnw
        }
        return nil
    }
    
}
