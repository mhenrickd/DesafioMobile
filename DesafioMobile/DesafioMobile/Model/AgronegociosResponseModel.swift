//
//  AgronegociosResponseModel.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 04/09/25.
//

import Foundation

struct AgronegociosResponseModel: Codable {
    let feed: Feed?
    
    struct Feed: Codable {
        let falkor: Falkor?
    }
    
    struct Falkor: Codable {
        let items: [FeedItem]?
    }
    struct FeedItem: Codable {
        let type: String?
        let content: Article?
        let metadata: String?
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
}
