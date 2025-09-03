//
//  NetworkManagerRepository.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//
import Foundation
import Alamofire

protocol NetworkManagerRepositoryProtocol {
    func fetchFeedNews(completion: @escaping(Bool, NewsResponseModel?) -> Void)
}

class NetworkManagerRepository: NetworkManagerRepositoryProtocol {
    static let shared = NetworkManagerRepository()
    var endpoint: URL = APIEndpoints.newsFeed.url
    
    public func fetchFeedNews(completion: @escaping(Bool, NewsResponseModel?) -> Void) {
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: NewsResponseModel.self) { response in
                switch response.result {
                    case .success(let newsResponse):
                        completion(true, newsResponse)
                        
                    case .failure(let error):
                        print("Error: \(error)")
                        completion(false, nil)
                }
            }
    }
}
