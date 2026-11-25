import UIKit

/// Root of the Link tab's navigation stack.
final class LinkViewController: MenuListViewController {
    override func viewDidLoad() {
        title = "Link"
        items = [
            Item(title: "Open Settings", showsDisclosure: true) { [weak self] in
                self?.navigationController?.pushViewController(SettingsViewController(), animated: true)
            },
        ]
        super.viewDidLoad()
    }
}
