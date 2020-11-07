//
//  GetArticleByIdUseCase.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/08.
//

import Foundation

final class GetArticleByIdUseCase: UseCaseProtocol {
    func execute(_ parameter: Int, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let res: ArticleEntity = .init(id: 1, userId: 1, title: "title", body: "body")
        completion?(.success(res))
    }
}
