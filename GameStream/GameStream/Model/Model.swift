//
//  Model.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import Foundation

struct Resultados: Codable {
    var results: [Game]
}

struct Games: Codable {
    var games: [Game]
}

struct Game: Codable, Hashable {
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrls: videoUrl
    var galleryImages: [String]
}

struct videoUrl: Codable, Hashable {
    var mobile: String
    var tablet: String
}

struct GameData {
    var url: String = ""
    var title: String = ""
    var studio: String = ""
    var contentRaiting: String = ""
    var publicationYear: String = ""
    var description: String = ""
    var platforms: [String] = []
    var tags: [String] = []
    var galleryImages: [String] = []
    
    init(game: Game) {
        url = game.videosUrls.mobile
        title = game.title
        studio = game.studio
        contentRaiting = game.contentRaiting
        publicationYear = game.publicationYear
        description = game.description
        platforms = game.platforms
        tags = game.tags
        galleryImages = game.galleryImages
    }
}
