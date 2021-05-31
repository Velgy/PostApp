//
//  MainView.swift
//  PostApp
//
//  Created by Valentin on 25.05.2021.
//

import UIKit

class MainView: UIView {
    
    let collectionView: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let view = UICollectionView(frame: frame, collectionViewLayout: layot)
        view.backgroundColor = .white
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = self.bounds
        
    }
}
