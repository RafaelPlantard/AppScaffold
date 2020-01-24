//
//  MonthCollectionViewDelegate.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import UIKit

final class MonthCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    private let action: (IndexPath) -> Void

    // MARK: Initializer

    init(action: @escaping (IndexPath) -> Void) {
        self.action = action
        super.init()
    }

    // MARK: UICollectionViewDelegateFlowLayout conforms

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.width / 3.6
        let width = height

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(
            width: collectionView.frame.width, height: UIFont.preferredFont(forTextStyle: .largeTitle).lineHeight + 16
        )
    }

    // MARK: UICollectionViewDelegate conforms

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        action(indexPath)
    }
}
