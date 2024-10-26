//
//  ImageLoaderView.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI

struct ImageLoaderView: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                //SDWebImageLoaderView(url: url, contentMode: contentMode)
                KingFisherBootcamp(url: url, contentMode: contentMode)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
}
