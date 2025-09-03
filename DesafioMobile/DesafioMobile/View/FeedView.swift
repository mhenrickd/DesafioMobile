//
//  FeedView.swift
//  DesafioMobile
//
//  Created by Matheus Henrick  Dias on 02/09/25.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
    @State private var showWebView = false
    
    private let article: ArticleModel
    
    init(article: ArticleModel) {
        self.article = article
    }
    
    var body: some View {
        contentView
    }
    
    @ViewBuilder
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(article.chapeu)
                .bold()
                .font(.subheadline)
            
            Text(article.title)
                .bold()
                .foregroundStyle(.red)
                .font(.headline)
            
            Text(article.description)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            KFImage(URL(string: article.imageUrl))
                .placeholder { ProgressView() }
                .resizing(referenceSize: CGSize(width: 380, height: 200))
                .cornerRadius(10)
            
            Divider()
            
            Text(article.metadata)
                .font(.footnote)
                .foregroundStyle(.gray)
            
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: article.articleUrl))
        }
        .onTapGesture {
            showWebView = !article.articleUrl.isEmpty
        }
    }
}
