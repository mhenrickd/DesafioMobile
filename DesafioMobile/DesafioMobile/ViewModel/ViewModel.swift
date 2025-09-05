//
//  ViewModel.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import Foundation

protocol ViewModelProtocol {
    func fetchHomeNews()
    func fetchAgronegocioNews()
}

class ViewModel: ObservableObject {
    @Published var articles: [ArticleModel] = []
    @Published var agronegocio: [ArticleModel] = []
    
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
    
    func fetchAgronegocioNews() {
        articlesUseCase.getAgronegocioArticles { [weak self] result in
            guard let fetchedArticles = result else { return }
            
            self?.agronegocio = fetchedArticles
        }
    }
}
