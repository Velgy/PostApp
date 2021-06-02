//
//  ViewController.swift
//  PostApp
//
//  Created by Valentin on 25.05.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let service = Service()
    let orderBy: OrderBy
    var loadMoreStatus = false
    var cursor: String?
    var items: [Item] = []
    
    init(orderBy: OrderBy) {
        self.orderBy = orderBy
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var mainView: MainView {
        return view as! MainView
    }
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "PostApp"
        
        mainView.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        doSome()
    }
    
    
    func doSome() {
        service.downloadPhoto(orderBy: orderBy, from: cursor) { result in
            
            self.items = result.data?.items ?? []
            self.cursor = result.data?.cursor
            self.mainView.collectionView.reloadData()
        }
    }
    
    
    
    func loadMoreData() {
        if !self.loadMoreStatus && self.cursor != nil {
            self.loadMoreStatus = true
            DispatchQueue.global().async {
                self.service.downloadPhoto(orderBy: self.orderBy, from: self.cursor) { result in
                    self.items.append(contentsOf: result.data?.items ?? [])
                    self.cursor = result.data?.cursor
                    DispatchQueue.main.async {
                        self.mainView.collectionView.reloadData()
                        self.loadMoreStatus = false
                    }
                }
            }
        }
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    struct Const {
        static let leftOffset: CGFloat = 10
        static let rightOffset: CGFloat = 10
        static let spacing: CGFloat = 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - Const.leftOffset - Const.rightOffset
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Const.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Const.spacing
    }
    
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = PostViewController()
        
        let name = items[indexPath.row].author?.name
        let photo = items[indexPath.row].author?.photo?.data.original.url
        let typeContent = items[indexPath.row].type
        
        if let textPost = items[indexPath.row].contents?[indexPath.section].data?.value {
            viewController.textPost = textPost
        }
        
        if let countLike = items[indexPath.row].stats.likes.count {
            
            viewController.likeLabel = String(countLike)
        }
        
        viewController.contentType = typeContent
        viewController.urlForAuthor = URL(string: photo ?? "nil")
        viewController.userName = name
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}


extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .white
        
        if let photo = items[indexPath.row].author?.photo?.data.original.url {
                cell.imageView.downloaded(from: "\(photo)")
        }
        return cell
    }
}


extension MainViewController: UIScrollViewDelegate {
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let currentOffset = scrollView.contentOffset.y
            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
            let deltaOffset = maximumOffset - currentOffset
            
            if deltaOffset <= 0 {
                
                loadMoreData()
            }
        }
}
