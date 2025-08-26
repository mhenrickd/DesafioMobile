//
//  NetworkManager.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//
import Foundation
import Combine

protocol NetworkManagerProtocol {
    func fetchHomeNews() -> AnyPublisher<APIResponseModel, Error>
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchHomeNews() -> AnyPublisher<APIResponseModel, any Error> {
        let endpoint = APIEndpoints.newsFeed
        
        return session.dataTaskPublisher(for: endpoint.url)
            .map(\.data)
            .decode(type: APIResponseModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
