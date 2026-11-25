import UIKit

/// A large-title, inset-grouped list with one row per menu item
/// (UIKit counterpart of the SwiftUI `List`s on the stack roots).
class MenuListViewController: UIViewController {
    struct Item {
        let title: String
        /// Shows a chevron like SwiftUI's `NavigationLink`; otherwise the row
        /// looks like a SwiftUI `Button` (tinted text).
        let showsDisclosure: Bool
        let action: () -> Void
    }

    var items: [Item] = []

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.list(
            using: UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        )
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        collectionView.frame = view.bounds
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.indexPathsForSelectedItems?.forEach {
            collectionView.deselectItem(at: $0, animated: animated)
        }
    }
}

extension MenuListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UICollectionViewListCell

        var content = cell.defaultContentConfiguration()
        content.text = item.title
        if !item.showsDisclosure { content.textProperties.color = .tintColor }
        cell.contentConfiguration = content
        cell.accessories = item.showsDisclosure ? [.disclosureIndicator()] : []
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items[indexPath.item].action()
        if !items[indexPath.item].showsDisclosure {
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}
