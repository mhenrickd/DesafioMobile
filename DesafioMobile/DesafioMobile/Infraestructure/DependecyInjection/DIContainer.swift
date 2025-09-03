//
//  DIContainer.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation

class DIContainer {
    static let shared = DIContainer()

    private init() {}
    
    func makeNetworkManager() -> NetworkManagerRepositoryProtocol {
        return NetworkManagerRepository()
    }
}
