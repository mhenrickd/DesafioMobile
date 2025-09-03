//
//  ViewModel.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation

protocol ViewModelProtocol {
    func fetchHomeNews()
}

class ViewModel: ObservableObject {
    @Published var articles: [ArticleModel] = []
    
    private let articlesUseCase: ArticlesUseCaseProtocol
    
    init(articlesUseCase: ArticlesUseCase = ArticlesUseCase()) {
        self.articlesUseCase = articlesUseCase
    }
    
    func fetchHomeNews() {
        articlesUseCase.getArticles { [weak self] result in
            guard let fetchedArticles = result else { return }
            
            self?.articles = fetchedArticles
        }
    }
}
