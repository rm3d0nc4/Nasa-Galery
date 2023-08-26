//
//  PhotoViewController.swift
//  Nasa Galery
//
//  Created by user on 07/08/23.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private let photos: [Photo] = [
        .init(name: "Sonda Alpha", date: "13 de Fevereiro de 2023", imageUrl: "", details: ""),
        .init(name: "Sonda Beta", date: "26 de Março de 2023", imageUrl: "", details: ""),
        .init(name: "Sonda Gamma", date: "12 de Junho de 2023", imageUrl: "", details: ""),
        .init(name: "Sonda Delta", date: "22 de Junho de 2023", imageUrl: "", details: "")
    ]
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.navigationItem.prompt = "Wellcome to"
        self.navigationItem.title = "Nasa Gallery"
    }
    
    private func setupView() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
        
    }
    
    // 2
    private func addViewsInHierarchy() {
        view.addSubview(tableView)
    }
    
    // 3
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
        ])
    }
    
}

extension PhotoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PhotoViewCell()
        let photo = photos[indexPath.row]
        cell.setup(photo: photo)
        
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail")
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
