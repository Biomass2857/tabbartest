import UIKit

/// Root of the Profile tab's navigation stack.
final class ProfileViewController: MenuListViewController {
    override func viewDidLoad() {
        title = "Profile"
        items = [
            Item(title: "Open Settings", showsDisclosure: false) { [weak self] in
                self?.navigationController?.pushViewController(SettingsViewController(), animated: true)
            },
        ]
        super.viewDidLoad()
    }
}
