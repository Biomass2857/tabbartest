import UIKit

/// UIKit counterpart of `SwiftUITabView`: Training, Profile and Link tabs.
final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tabs = [
            UITab(title: "Training", image: UIImage(systemName: "dumbbell"), identifier: "training") { _ in
                LabelViewController(text: "Training")
            },
            UITab(title: "Profile", image: UIImage(systemName: "person"), identifier: "profile") { _ in
                UINavigationController(rootViewController: ProfileViewController())
            },
            UITab(title: "Link", image: UIImage(systemName: "link"), identifier: "link") { _ in
                UINavigationController(rootViewController: LinkViewController())
            },
        ]
    }
}
