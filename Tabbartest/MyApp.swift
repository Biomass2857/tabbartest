import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            if AppConfig.useUIKit {
                UIKitTabView()
                    .ignoresSafeArea()
            } else {
                SwiftUITabView()
            }
        }
    }
}
