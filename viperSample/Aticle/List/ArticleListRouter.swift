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
        let viewController = ArticleDetailViewController()
        viewController.articleEntity = articleEntity
        viewController.presenter = ArticleDetailPresenter(
            view: viewController,
            inject: .init(getArticleByIdUseCase: .init(GetArticleByIdUseCase())))
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
