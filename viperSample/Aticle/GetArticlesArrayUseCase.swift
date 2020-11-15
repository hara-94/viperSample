//
//  GetArticlesArrayUseCase.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/08.
//

import Foundation

final class GetArticlesArrayUseCase: UseCaseProtocol {
    //executeメソッドで明示されているので省略可
    typealias Parameter = Void
    typealias Success = [ArticleEntity]
    typealias Failure = Error
    
    func execute(_ parameter: Void, completion: ((Result<[ArticleEntity], Error>) -> ())?) {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
                return
            }
            guard let data = data, let decoded = try? JSONDecoder().decode([ArticleEntity].self, from: data) else {
                let error = NSError(domain: "parse-error", code: 1, userInfo: nil)
                DispatchQueue.main.async {
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
