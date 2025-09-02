//
//  ContentView.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 26/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
    
    var body: some View {
        VStack {
            makeFeedView()
        }.onAppear {
            viewModel.fetchHomeNews()
        }
    }
    
    @ViewBuilder
    func makeFeedView() -> some View {
        ScrollView {
            if let articles = viewModel.articles {
                ForEach(articles, id: \.self) { article in
                    FeedView(chapeu: article.chapeu?.label ?? "",
                             title: article.title ?? "",
                             imageUrl: article.image?.sizes?.L?.url ?? "",
                             description: article.summary ?? "")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
