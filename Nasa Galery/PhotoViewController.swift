//
//  PhotoViewController.swift
//  Nasa Galery
//
//  Created by user on 07/08/23.
//

import UIKit

class PhotoViewController: UIViewController {
    
//    private let photos: [Photo] = [
//        .init(title: "Sonda Alpha", date: "13 de Fevereiro de 2023", url: "", explanation: ""),
//        .init(title: "Sonda Beta", date: "26 de Março de 2023", url: "", explanation: ""),
//        .init(title: "Sonda Gamma", date: "12 de Junho de 2023", url: "", explanation: ""),
//        .init(title: "Sonda Delta", date: "22 de Junho de 2023", url: "", explanation: "")
//    ]
    
    private var photos: [Photo] = []
    
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
        fetchNasaPhotos()
        
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
    
    private func dateFormat(photo: Photo) -> Photo {
            let date = photo.date
            let newDate = date.split(separator: "-").reversed().joined(separator: "/")
            
            return Photo(title: photo.title, date: newDate, url: photo.url, explanation: photo.explanation);
        }
    
    private func fetchNasaPhotos() {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=hwysEVog18DGSczBaNB8XbHKfHTHuzgCxogtBBGe&start_date=2023-08-20")!
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in if error != nil {print("error1");return}
            guard let data else {print("error2");return}
            guard let remotePhotos = try? decoder.decode([Photo].self, from: data) else {print("error3");return}
            self.photos = remotePhotos.map(self.dateFormat)
            print(remotePhotos)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
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
        let photo = photos[indexPath.row]
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.photo = photo
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}
