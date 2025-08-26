//
//  Endpoints.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation

enum APIEndpoints {
    case newsFeed

    var url: URL {
        switch self {
        case .newsFeed:
            return URL(string: "https://native-leon.globo.com/feed/g1")!
        }
    }
}
