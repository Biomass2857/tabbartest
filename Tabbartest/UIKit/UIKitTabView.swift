import SwiftUI
import UIKit

/// Hosts the UIKit implementation inside the SwiftUI app lifecycle.
struct UIKitTabView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainTabBarController {
        MainTabBarController()
    }

    func updateUIViewController(_ controller: MainTabBarController, context: Context) {}
}
