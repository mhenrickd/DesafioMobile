//
//  Endpoints.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation

enum APIEndpoints {
    case newsFeed
    case agronegociosFeed

    var url: URL {
        switch self {
            case .newsFeed:
                return URL(string: "https://native-leon.globo.com/feed/g1")!
            case .agronegociosFeed:
                return URL(string: "https://native-leon.globo.com/feed/https://g1.globo.com/economia/agronegocios")!
        }
    }
}
