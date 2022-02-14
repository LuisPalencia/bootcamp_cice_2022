//
//  MenuServerModel.swift
//  CiceMusic
//
//  Created by CICE on 14/02/2022.
//

import Foundation

// MARK: - MenuServerModel
struct MenuServerModel: Codable {
    let menuResponse: [MenuResponse]?

    enum CodingKeys: String, CodingKey {
        case menuResponse = "menuResponse"
    }
}

// MARK: - MenuResponse
struct MenuResponse: Codable {
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

// MARK: - Menu
struct Menu: Codable {
    let imagen: String?
    let literal: String?

    enum CodingKeys: String, CodingKey {
        case imagen = "imagen"
        case literal = "literal"
    }
}
