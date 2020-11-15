//
//  ArticleListRouter.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/08.
//

import UIKit

protocol ArticleListRouterProtocol: AnyObject {
    func showArticleDetail(articleEntity: ArticleEntity)
}

class ArticleListRouter: ArticleListRouterProtocol {
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func showArticleDetail(articleEntity: ArticleEntity) {
        //仮実装
        print("詳細画面は遷移 記事ID: \(articleEntity.id)")
    }
}
