//
//  ViewController.swift
//  Nasa Galery
//
//  Created by Projeto Apraxia on 03/08/23.
//

import UIKit

class MovieViewController: UIViewController {
//    private let movies = [
//        "Homem Formiga",
//        "Guardiões da Galáxia Vol. 3",
//        "Resgate 2",
//        "Elementos",
//        "O Bixo vai pegar 3"
//    ]
    
    private let movies : [Movie] = [
        .init(title: "Homem Formiga", releaseDate: "12/08", imageUrl: ""),
        .init(title: "Guardiões da Galáxia Vol. 3", releaseDate: "12/08", imageUrl: ""),
        .init(title: "Resgate 2", releaseDate: "12/08", imageUrl: ""),
        .init(title: "Elementos", releaseDate: "12/08", imageUrl: ""),
        .init(title: "O Bixo vai pegar 3", releaseDate: "12/08", imageUrl: "")
    ]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Filmes Populares"
        return label
    }()
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
       return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    
    private func setupView() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
    }
    private func addViewsInHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieCell()
        let movie = movies[indexPath.row]
        cell.setup(movie: movie)
        
        return cell
    }
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail")
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
