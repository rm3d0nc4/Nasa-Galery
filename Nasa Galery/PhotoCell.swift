//
//  PhotoCell.swift
//  Nasa Galery
//
//  Created by Projeto Apraxia on 17/08/23.
//

import Foundation
import UIKit

class PhotoViewCell: UITableViewCell {
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let horizontakStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        addViewsInHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    public func setup(photo: Photo) {
        titleLabel.text = photo.name
        releaseDateLabel.text = "Data: \(photo.date)"
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.white
        //Gerar cards
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.contentView.layer.shadowRadius = 4
        
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(horizontakStack)
        horizontakStack.addArrangedSubview(photoImageView)
        horizontakStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(releaseDateLabel)
        verticalStack.addArrangedSubview(UIView())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontakStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            horizontakStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            horizontakStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontakStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 90),
            photoImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

    
}


