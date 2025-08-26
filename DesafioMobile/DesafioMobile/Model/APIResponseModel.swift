//
//  Untitled.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation

import Foundation

struct APIResponseModel: Codable {
    let resource: Resource
    let content_type: ContentType
    let feed: Feed
}

struct Status: Codable {
    let slug: String
    let type: String
    let name: String
}

struct Resource: Codable {
    let id: String
    let title: String
    let description: String
    let status: Status
    let created: Date
    let modified: Date
    let createdBy: String
    let tenantId: String
    let versionId: String
    let scheduled: Bool
    let scheduledDate: Date?
    let issued: Date?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, description, status, created, modified, createdBy, tenantId, versionId, scheduled, scheduledDate, issued
    }
    
    init(from decoder: Decoder) throws {
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
}


struct ContentType: Codable {
    let api: String
    let className: String
    let created: Date
    let createdBy: String
    let customName: String
    let id: String
    let modified: Date
    let name: String
    let schema: String
    let tenantId: String
    let urlType: String
    let useCustomName: Bool
    let versionId: String
}

struct Feed: Codable {
    let oferta: String
    let falkor: Falkor
}

struct Falkor: Codable {
    let items: [Item]
}

struct Item: Codable {
    let id: String?
    let feedId: String?
    let type: String
    let content: ItemContent?
    let lastPublication: Date?
    let publication: Date?
}

struct ItemContent: Codable {
    let chapeu: Chapeu?
    let identifier: String
    let image: ImageInfo?
    let section: String
    let summary: String
    let title: String
    let url: String
}

struct Chapeu: Codable {
    let label: String
}

struct ImageInfo: Codable {
    let cropOptions: CropOptions?
    let rightsHolder: String
    let size: ImageSize
    let sizes: [String: ImageSize]
}

struct CropOptions: Codable {
    let landscape: Rectangle
}

struct Rectangle: Codable {
    let top: Int
    let bottom: Int
    let left: Int
    let right: Int
}

struct ImageSize: Codable {
    let url: String
    let width: Int
    let height: Int
}

