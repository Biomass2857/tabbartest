import UIKit

/// Pushed screen. Hides the tab bar the UIKit way: the flag must be set
/// before the push, which is why it's set in init.
final class SettingsViewController: LabelViewController {
    init() {
        super.init(text: "Settings")
        title = "Settings"
        hidesBottomBarWhenPushed = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
