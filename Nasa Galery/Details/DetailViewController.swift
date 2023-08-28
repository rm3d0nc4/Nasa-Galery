//
//
//
//  DetainViewController.swift
//  Nasa Galery
//
//  Created by user on 25/08/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var photoDescription: UILabel!
    @IBOutlet weak var photoDate: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    
    var photo: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.layer.cornerRadius = 8
        photoImageView.layer.masksToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.backgroundColor = .systemGray4
        
        configure(with: photo)
    
    }
    
    
    
    
    func configure(with photo: Photo) {
        photoTitle.text = photo.title
        photoDate.text = "Data de captura: \(photo.date)"
        photoDescription.text = photo.explanation
        photoImageView.download(from: photo.url)
    }
}
