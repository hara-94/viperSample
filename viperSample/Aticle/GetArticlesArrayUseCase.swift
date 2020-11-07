//
//  GetArticlesArrayUseCase.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/08.
//

import Foundation

final class GetArticlesArrayUseCase: UseCaseProtocol {
    func execute(_ parameter: Void, completion: ((Result<[ArticleEntity], Error>) -> ())?) {
        let res: [ArticleEntity] = [
            .init(id: 1, userId: 1, title: "title1", body: "body1"),
            .init(id: 2, userId: 2, title: "title2", body: "body2"),
            .init(id: 3, userId: 3, title: "title3", body: "body3")
        ]
        completion?(.success(res))
    }
}
