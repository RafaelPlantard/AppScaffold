//
//  YearCollectionViewDelegate.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import UIKit

final class YearCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    private let action: (IndexPath) -> Void

    // MARK: Initializer

    init(action: @escaping (IndexPath) -> Void) {
        self.action = action
        super.init()
    }

    // MARK: UICollectionViewDelegateFlowLayout conforms

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: collectionView.frame.width / 3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    // MARK: UICollectionViewDelegate conforms

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        action(indexPath)
    }
}
