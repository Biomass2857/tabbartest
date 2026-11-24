import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Training", systemImage: "dumbbell") {
                Text("Training")
            }
            Tab("Profile", systemImage: "person") {
                ProfileRoot()
            }
            Tab("Link", systemImage: "link") {
                LinkRoot()
            }
        }
    }
}

struct LinkRoot: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Open Settings") {
                    Text("Settings")
                        .navigationTitle("Settings")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
            .navigationTitle("Link")
        }
    }
}

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
            .navigationDestination(for: ProfileRoute.self) { route in
                switch route {
                case .settings:
                    Text("Settings")
                        .navigationTitle("Settings")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
