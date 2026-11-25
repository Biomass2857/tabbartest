import SwiftUI
import UIKit

/// Reports UIKit appearance transitions of the navigation screen it is placed in.
/// SwiftUI's onAppear/onDisappear miss a cancelled interactive swipe-back,
/// so we use viewWillAppear/viewWillDisappear plus the transition coordinator.
struct AppearanceObserver: UIViewControllerRepresentable {
    let onChange: (_ isVisible: Bool) -> Void

    func makeUIViewController(context: Context) -> Controller { Controller() }
    func updateUIViewController(_ controller: Controller, context: Context) {
        controller.onChange = onChange
    }

    final class Controller: UIViewController {
        var onChange: ((Bool) -> Void)?

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            report(true)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            // Only react when another screen is pushed on top of ours.
            // Switching tabs also makes us disappear, but must not hide the bar.
            guard isCoveredByPush else { return }
            report(false)
        }

        /// True when our screen is still in the navigation stack but no longer
        /// its top (i.e. something was pushed on top of it).
        private var isCoveredByPush: Bool {
            guard let nav = navigationController,
                  let screen = screenInStack(of: nav) else { return false }
            return nav.viewControllers.contains(screen) && nav.topViewController !== screen
        }

        /// The ancestor controller that sits directly in the navigation stack.
        private func screenInStack(of nav: UINavigationController) -> UIViewController? {
            var vc: UIViewController? = self
            while let current = vc, current.parent !== nav { vc = current.parent }
            return vc
        }

        /// Applies the new state at the START of the transition and reverts it
        /// if the transition gets cancelled (e.g. a swipe-back let go early).
        private func report(_ isVisible: Bool) {
            onChange?(isVisible)
            transitionCoordinator?.notifyWhenInteractionChanges { [weak self] context in
                if context.isCancelled { self?.onChange?(!isVisible) }
            }
        }
    }
}
