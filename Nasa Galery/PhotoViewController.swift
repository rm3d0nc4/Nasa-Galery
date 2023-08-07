//
//  PhotoViewController.swift
//  Nasa Galery
//
//  Created by user on 07/08/23.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        
        return table
    }()
}
