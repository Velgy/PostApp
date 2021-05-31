//
//  PostView.swift
//  PostApp
//
//  Created by Valentin on 26.05.2021.
//

import UIKit

class PostView: UIView{
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10.0
        return image
    }()
    
    let labelName: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let labelText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let postImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10.0
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(labelName)
        addSubview(labelText)
        addSubview(postImage)
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        let guide = safeAreaLayoutGuide
        
        imageView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.0).isActive = true
        
        labelName.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        labelName.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 30.0).isActive = true
        
        labelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30.0).isActive = true
        labelText.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        
        postImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.0).isActive = true
        postImage.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 30.0).isActive = true
        postImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 30.0).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
    }
}
