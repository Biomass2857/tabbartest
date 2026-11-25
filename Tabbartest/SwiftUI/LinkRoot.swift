import SwiftUI

struct LinkRoot: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Open Settings") {
                    SettingsView()
                }
            }
            .navigationTitle("Link")
            .hidesTabBarOnPushedScreens()
        }
    }
}
