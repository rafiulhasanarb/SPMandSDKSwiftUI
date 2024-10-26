//
//  SDWebImageLoaderView.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageLoaderView: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: url))
            .onSuccess { image, data, cachType in
                
            }
            .onFailure { error in
                
            }
            //.placeholder(Image(systemName: "photo"))
            //.placeholder(content: { Color.gray.opacity(0.3) })
            .resizable()
            .indicator(Indicator { _, _ in
                ProgressView()
            })
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    SDWebImageLoaderView(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
}
