import SwiftUI

struct SwiftUITabView: View {
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

#Preview {
    SwiftUITabView()
}
