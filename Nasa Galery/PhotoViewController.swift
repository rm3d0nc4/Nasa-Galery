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

    private let tableview: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none

        return table
    }()
    
//    private let navItem: UINavigationItem = {
//        let navItem = UINavigationItem()
//
//        navItem.title = "Nasa Galery"
//        navItem.prompt = "Welcome to"
//         return navItem
//    }()
//
//    private let navigationBar: UINavigationBar = {
//        let navigationBar = UINavigationBar()
//        navigationBar.translatesAutoresizingMaskIntoConstraints = false
//        navigationBar.isTranslucent = true
//
//        return navigationBar
//    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        tableview.dataSource = self
        
        addViewsInHierarchy()
        setupConstraints()
    }
    
    func addViewsInHierarchy() {
//        view.addSubview(navigationBar)
        view.addSubview(tableview)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])

        }
        
        
}


extension PhotoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return PhotoViewCell.setup(photo: photos[indexPath.row])
    }
    
    
}
