//
//  NetworkManagerRepository.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//
import Foundation
import Alamofire

protocol NetworkManagerRepositoryProtocol {
    func fetchFeedNews(endpoint: URL, completion: @escaping(Bool, NewsResponseModel?) -> Void)
    func fetchFeedAgronegocios(completion: @escaping(Bool, AgronegociosResponseModel?) -> Void)
}

class NetworkManagerRepository: NetworkManagerRepositoryProtocol {
    static let shared = NetworkManagerRepository()
    
    public func fetchFeedNews(endpoint: URL, completion: @escaping(Bool, NewsResponseModel?) -> Void) {
        AF.request(APIEndpoints.newsFeed.url, method: .get)
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
    
    public func fetchFeedAgronegocios(completion: @escaping(Bool, AgronegociosResponseModel?) -> Void) {
        AF.request(APIEndpoints.agronegociosFeed.url, method: .get)
            .validate()
            .responseDecodable(of: AgronegociosResponseModel.self) { response in
                switch response.result {
                    case .success(let AgronegociosRespons):
                        completion(true, AgronegociosRespons)
                        
                    case .failure(let error):
                        print("Error: \(error)")
                        completion(false, nil)
                }
            }
    }
}
