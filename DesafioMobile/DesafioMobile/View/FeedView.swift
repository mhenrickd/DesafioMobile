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
    
    private let chapeu: String
    private let title: String
    private let imageUrl: String
    private let description: String
    private let articleUrl: String
    
    init(chapeu: String, title: String, imageUrl: String, description: String, articleUrl: String) {
        self.chapeu = chapeu
        self.title = title
        self.imageUrl = imageUrl
        self.description = description
        self.articleUrl = articleUrl
    }
    
    var body: some View {
        contentView
    }
    
    @ViewBuilder
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(chapeu)
                .foregroundStyle(.gray)
                .bold()
            
            Text(title)
                .bold()
            
            KFImage(URL(string: imageUrl))
                .placeholder { ProgressView() }
                .resizing(referenceSize: CGSize(width: 380, height: 150))
                .cornerRadius(5)
            
            Divider()
            
            Text(description)
                .bold()
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: articleUrl))
        }
        .onTapGesture {
            showWebView = !articleUrl.isEmpty
        }
    }
}
