//
//  ArticlesUseCase.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 03/09/25.
//

import Foundation

protocol ArticlesUseCaseProtocol {
    func getArticles(completion: @escaping ([ArticleModel]?) -> Void)
}

class ArticlesUseCase: ArticlesUseCaseProtocol {
    private let networkManager: NetworkManagerRepositoryProtocol
    
    init(networkManager: NetworkManagerRepositoryProtocol = DIContainer.shared.makeNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getArticles(completion: @escaping ([ArticleModel]?) -> Void) {
        networkManager.fetchFeedNews { (success, newsResponse) in
            guard success, let items = newsResponse?.feed?.falkor?.items else {
                completion(nil)
                return
            }
                    
            let articleModels = items
                .filter { $0.content?.type == "basico" || $0.content?.type == "materia" }
                .compactMap { $0.content
                    return ArticleModel(
                        chapeu: $0.content?.chapeu?.label ?? "",
                        title: $0.content?.title ?? "",
                        imageUrl: $0.content?.image?.sizes?.L?.url ?? "",
                        description: $0.content?.summary ?? "",
                        articleUrl: $0.content?.url ?? "",
                        metadata: $0.metadata ?? ""
                    )
                }
            
            DispatchQueue.main.async {
                completion(articleModels)
            }
        }
    }
}
