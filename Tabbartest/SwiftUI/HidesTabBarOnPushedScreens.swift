import SwiftUI

/// Apply to the ROOT view of a NavigationStack. The tab bar is hidden on every
/// screen pushed on top of it and shown again as soon as navigating back
/// *starts*, instead of after the pop has finished, which is what you get
/// with `.toolbarVisibility(.hidden, for: .tabBar)` on the pushed screen.
extension View {
    func hidesTabBarOnPushedScreens() -> some View {
        modifier(HidesTabBarOnPushedScreens())
    }
}

private struct HidesTabBarOnPushedScreens: ViewModifier {
    @State private var isRootVisible = true

    func body(content: Content) -> some View {
        content
            .toolbarVisibility(isRootVisible ? .visible : .hidden, for: .tabBar)
            .background(
                AppearanceObserver { isRootVisible = $0 }
                    .frame(width: 0, height: 0)
            )
    }
}
