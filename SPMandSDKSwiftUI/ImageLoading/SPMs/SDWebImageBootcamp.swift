//
//  SDWebImageBootcamp.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI

struct SDWebImageBootcamp: View {
    
    var body: some View {
        SDWebImageLoaderView(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
            .frame(width: 300, height: 300)

    }
}

#Preview {
    SDWebImageBootcamp()
}
