import SwiftUI

enum ProfileRoute: Hashable {
    case settings
}

struct ProfileRoot: View {
    @State private var path: [ProfileRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Open Settings") { path.append(.settings) }
            }
            .navigationTitle("Profile")
            .hidesTabBarOnPushedScreens()
            .navigationDestination(for: ProfileRoute.self) { route in
                switch route {
                case .settings:
                    SettingsView()
                }
            }
        }
    }
}
