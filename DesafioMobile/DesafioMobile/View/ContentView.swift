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
        .padding(.top)
    }
    
    @ViewBuilder
    func makeFeedView() -> some View {
        ScrollView {
            ForEach(viewModel.articles, id: \.self) { article in
                FeedView(article: article)
                    .padding(.all, 16)
                    .background(Color.white)
            }
        }
        .background(Color.gray)
    }
}

#Preview {
    ContentView()
}
