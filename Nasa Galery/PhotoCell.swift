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
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 17, weight: .medium)
        title.textColor = .black
        title.numberOfLines = 0
        return title
    }()
    
    private let detailLabel: UILabel = {
        let detail = UILabel()
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.font = .systemFont(ofSize: 12, weight: .regular)
        detail.textColor = .gray
        return detail
    }()
    
    
    private let horizontalStack: UIStackView = {
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.spacing = 20
        return hStack
    }()
    
    
    private let verticalStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.distribution = .equalCentering
        return vStack
    }()

    
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            nil
        }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupVIew()
        addViewsInHierarchy()
        setupConstraints()
    }
    
    static func setup(photo: Photo) -> PhotoViewCell {
        let photoCell = PhotoViewCell()
        
        photoCell.titleLabel.text = photo.name
        photoCell.detailLabel.text = photo.details
        // Fazer download da imagem
        
        return photoCell
    }
    
    func setupVIew() {
        selectionStyle = .none
    }
    
    func addViewsInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(imageView!)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(detailLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)

        ])
        
        NSLayoutConstraint.activate([
            imageView!.heightAnchor.constraint(equalToConstant: 60),
            imageView!.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    
}


