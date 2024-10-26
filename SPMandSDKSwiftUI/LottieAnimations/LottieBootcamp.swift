//
//  LottieBootcamp.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI
import Lottie

struct LottieBootcamp: View {
    
    var fileName: String = ""
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        //LottieView(animation: .from(data: Data))
        LottieView(animation: .named(fileName))
            .configure({ lottieView in
                lottieView.shouldRasterizeWhenIdle = true
                lottieView.contentMode = contentMode
            })
            .playbackMode(.paused(at: .progress(0.8)))
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
    }
}

#Preview {
    LottieBootcamp()
}
