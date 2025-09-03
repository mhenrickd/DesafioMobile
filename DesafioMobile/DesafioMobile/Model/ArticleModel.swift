//
//  ArticleModel.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 02/09/25.
//

struct ArticleModel: Codable, Hashable {
    let chapeu: String
    let title: String
    let imageUrl: String
    let description: String
    let articleUrl: String
    let metadata: String
}
