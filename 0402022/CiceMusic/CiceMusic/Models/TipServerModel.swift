//
//  ConsejoServerModel.swift
//  CiceMusic
//
//  Created by CICE on 17/02/2022.
//

import Foundation

// MARK: - TipServerModel
struct TipServerModel: Codable {
    let icoResponseConsejos: IcoResponseConsejos?
    let aPIError: APIError?

    enum CodingKeys: String, CodingKey {
        case icoResponseConsejos = "icoResponseConsejos"
        case aPIError = "aPIError"
    }
}

// MARK: - APIError
struct APIError: Codable {
    let code: Int?
    let error: ErrorTip?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case error = "error"
    }
}

// MARK: - Error
struct ErrorTip: Codable {
    let message: String?

    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}

// MARK: - IcoResponseConsejos
struct IcoResponseConsejos: Codable {
    let consejosGenerales: [ConsejosGenerale]?

    enum CodingKeys: String, CodingKey {
        case consejosGenerales = "consejosGenerales"
    }
}

// MARK: - ConsejosGenerale
struct ConsejosGenerale: Codable {
    let image: String?
    let title: String?
    let subtitle: String?
    let messageArray: [MessageArray]?

    enum CodingKeys: String, CodingKey {
        case image = "image"
        case title = "title"
        case subtitle = "subtitle"
        case messageArray = "messageArray"
    }
}

// MARK: - MessageArray
struct MessageArray: Codable {
    let titleMessage: String?
    let developMessage: String?

    enum CodingKeys: String, CodingKey {
        case titleMessage = "titleMessage"
        case developMessage = "developMessage"
    }
}
