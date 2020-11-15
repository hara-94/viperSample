//
//  ArticleListPresenter.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/08.
//

import Foundation

protocol ArticleListPresenterProtocol: AnyObject {
    func didLoad()
    func didSelect(articleEntity: ArticleEntity)
}

protocol ArticleListViewProtocol: AnyObject {
    func showArticles(_ articleEntities: [ArticleEntity])
    func showEmpty()
    func showError(_ error: Error)
}

class ArticleListPresenter: ArticleListPresenterProtocol {
    weak var view: ArticleListViewProtocol!
    private var di: Dependency
    
    init(view: ArticleListViewProtocol, inject dependency: Dependency) {
        self.view = view
        self.di = dependency
    }
}

extension ArticleListPresenter {
    func didLoad() {
        di.getArticlisArrayUseCase.execute(()) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(articleEntities):
                if articleEntities.isEmpty {
                    self.view.showEmpty()
                }
                self.view.showArticles(articleEntities)
            case let .failure(error):
                self.view.showError(error)
            }
        }
    }
    
    func didSelect(articleEntity: ArticleEntity) {
        di.router.showArticleDetail(articleEntity: articleEntity)
    }
}

extension ArticleListPresenter {
    struct Dependency {
        let router: ArticleListRouterProtocol!
        let getArticlisArrayUseCase: UseCase<Void, [ArticleEntity], Error>
    }
}
