//
//  GetArticleByIdUseCase.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/08.
//

import Foundation

final class GetArticleByIdUseCase: UseCaseProtocol {
    func execute(_ parameter: Int, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(parameter)")!
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
                return
            }
            guard let data = data, let decoded = try? JSONDecoder().decode(ArticleEntity.self, from: data) else {
                DispatchQueue.main.async {
                    let error = NSError(domain: "parse-error", code: 1, userInfo: nil)
                    completion?(.failure(error))
                }
                return
            }
            DispatchQueue.main.async {
                completion?(.success(decoded))
            }
        }
        task.resume()
    }
}
