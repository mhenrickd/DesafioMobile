//
//  NetworkManager.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//
import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func fetchFeedNews(completion: @escaping(Bool, [Article]?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    var endpoint: URL = APIEndpoints.newsFeed.url
        
    public func fetchFeedNews(completion: @escaping(Bool, [Article]?) -> Void) {
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: NewsResponse.self) { response in
                switch response.result {
                    case .success(let newsResponse):
                        let articles = newsResponse.feed?.falkor?.items?.compactMap { $0.content }
                        completion(true, articles)
                        
                    case .failure(let error):
                        print("Error: \(error)")
                        completion(false, nil)
                }
            }
    }
}
