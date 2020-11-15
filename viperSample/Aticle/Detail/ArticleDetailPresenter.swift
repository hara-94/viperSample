//
//  ArticleDetailPresenter.swift
//  viperSample
//
//  Created by 原暉 on 2020/11/15.
//

import Foundation

protocol ArticleDetailPresenterProtocol: AnyObject {
    func didLoad(articleEntity: ArticleEntity)
}

protocol ArticleDetailViewProtocol: AnyObject {
    func showArticle(_ articleEntity: ArticleEntity)
    func showError(_ error: Error)
}

final class ArticleDetailPresenter {
    weak var view: ArticleDetailViewProtocol!
    private let di: Dependency
    
    init(view: ArticleDetailViewProtocol, inject depedency: Dependency) {
        self.view = view
        self.di = depedency
    }
}

extension ArticleDetailPresenter {
    struct Dependency {
        let getArticleByIdUseCase: UseCase<Int, ArticleEntity, Error>
    }
}

extension ArticleDetailPresenter: ArticleDetailPresenterProtocol {
    func didLoad(articleEntity: ArticleEntity) {
        di.getArticleByIdUseCase.execute(articleEntity.id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(articleEntity):
                self.view.showArticle(articleEntity)
            case let .failure(error):
                self.view.showError(error)
            }
        }
    }
}
