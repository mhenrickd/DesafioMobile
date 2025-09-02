//
//  ViewModel.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation
import Combine

protocol ViewModelProtocol {
    func fetchHomeNews()
}

class ViewModel: ObservableObject {
    @Published var articles: [Article]?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = DIContainer.shared.makeNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchHomeNews() {
        networkManager.fetchFeedNews { (success, articles) in
            self.articles = articles
        }
    }
}
