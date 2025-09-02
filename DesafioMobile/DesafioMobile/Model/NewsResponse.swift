//
//  NewsResponse.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 02/09/25.
//

import Foundation

struct NewsResponse: Codable {
    let feed: Feed?
}

struct Feed: Codable {
    let falkor: Falkor?
}

struct Falkor: Codable {
    let items: [FeedItem]?
}

struct FeedItem: Codable {
    let content: Article?
}

struct Article: Codable, Equatable ,Hashable {
    let id: String = UUID().uuidString
    let chapeu: Chapeu?
    let title: String?
    let summary: String?
    let image: Image?
    let type: String?
    let url: String?
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
}

struct Image: Codable, Hashable {
    let id: String = UUID().uuidString
    let sizes: Sizes?
}

struct Sizes: Codable, Hashable {
    let L: L?
}

struct L: Codable, Hashable {
    let url: String?
}

struct Chapeu: Codable, Hashable {
    let id: String = UUID().uuidString
    let label: String?
}
