//
//  KingFisherBootcamp.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI
import Kingfisher

struct KingFisherBootcamp: View {
    
    let url: String
    var contentMode: SwiftUI.ContentMode = .fill
    
    var body: some View {
        KFImage(URL(string: url)!)
            .placeholder {
                Color.gray.opacity(0.4)
            }
            .resizable()
            .aspectRatio(contentMode: contentMode)
            //.setProcessor(processor)
            //.loadDiskFileSynchronously()
            //.cacheMemoryOnly()
            //.fade(duration: 0.25)
            //.lowDataModeSource(.network(lowResolutionURL))
            //.onProgress { receivedSize, totalSize in  }
            //.onSuccess { result in  }
            //.onFailure { error in }
    }
}

#Preview {
    KingFisherBootcamp(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
}
