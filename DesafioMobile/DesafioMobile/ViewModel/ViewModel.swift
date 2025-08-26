//
//  ViewModel.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation
import Combine

protocol ViewModelProtocol {
    func loadHomeNews()
}

class ViewModel: ObservableObject {
    @Published var homeFeed: APIResponseModel? = nil
    @Published var error: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = DIContainer.shared.makeNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadNewsFeed() {
        NetworkManager.shared.fetchHomeNews()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.error = error.localizedDescription
                }
            }, receiveValue: { homeFeed in
                self.homeFeed = homeFeed
            })
            .store(in: &cancellables)
    }
}
