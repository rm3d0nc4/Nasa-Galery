//
//  DownloadPhoto.swift
//  Nasa Galery
//
//  Created by Projeto Apraxia on 28/08/23.
//

import Foundation
import UIKit


extension UIImageView {
    func download(from path: String) {
        let url = URL(string: path)!
        
        URLSession.shared.dataTask(with: .init(url: url)){ data, _, error in
            if error != nil {return}
            
            if let data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else {return}
        }.resume()
    }
}
