//
//  ArticleEntity.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/06.
//

import Foundation

struct ArticleEntity: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
