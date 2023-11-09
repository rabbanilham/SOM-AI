//
//  TestimonyCollectionView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 09/11/2023.
//

import UIKit

final class TestimonyCollectionView: DefaultCollectionView {
    
    // MARK: - Initializer -
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(TestimonyCollectionViewCell.self, forCellWithReuseIdentifier: "\(TestimonyCollectionViewCell.self)")
        backgroundColor = R.color.backgroundWhite()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        register(TestimonyCollectionViewCell.self, forCellWithReuseIdentifier: TestimonyCollectionViewCell.description())
        backgroundColor = R.color.backgroundWhite()
    }
}
