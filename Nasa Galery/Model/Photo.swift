//
//  Photo.swift
//  Nasa Galery
//
//  Created by Projeto Apraxia on 10/08/23.
//

import Foundation

struct Photo: Decodable {
    let title: String
    let date: String
    let url: String
    let explanation: String
}
