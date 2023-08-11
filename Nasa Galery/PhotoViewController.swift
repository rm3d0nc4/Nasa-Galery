//
//  PhotoViewController.swift
//  Nasa Galery
//
//  Created by user on 07/08/23.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private let photos: [Photo] = [
        Photo(name: "Victória", date: Date(), imageUrl: "abcde", details: "Uma moça bonite"),
        Photo(name: "Romero", date: Date(), imageUrl: "bcder", details: "Uma pessoa")
    ]

//    private let tableview: UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
//
//        return table
//    }()
    
    private let navItem: UINavigationItem = {
        let navItem = UINavigationItem()

        navItem.title = "Nasa Galery"
        navItem.prompt = "Welcome to"
         return navItem
    }()
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.isTranslucent = true
        
        return navigationBar
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        addViewsInHierarchy()
        setupConstraints()
    }
    
    func addViewsInHierarchy() {
        view.addSubview(navigationBar)
        navigationBar.pushItem(navItem, animated: true)

//        view.addSubview(titleLabel)
//        view.addSubview(tableview)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
//        NSLayoutConstraint.activate([
//                    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//                    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//                    titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//                ])

        }
        
        
}
