//
//  ArticleDetailViewController.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/06.
//

import UIKit

final class ArticleDetailViewController: UIViewController {
    private let tableView: UITableView = .init()
    var articleEntity: ArticleEntity!
    var presenter: ArticleDetailPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        
        setTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad(articleEntity: articleEntity)
    }
}

extension ArticleDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ArticleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch row {
        case .title:
            cell.textLabel?.text = "Title"
            cell.detailTextLabel?.text = articleEntity.title
            print(articleEntity.title)
        case .body:
            cell.textLabel?.text = articleEntity.body
            cell.detailTextLabel?.text = nil
        }
        return cell
    }
}

private extension ArticleDetailViewController {
    enum Row: String {
        case title
        case body
        
        static var rows: [Row] {
            return [.title, .body]
        }
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension ArticleDetailViewController: ArticleDetailViewProtocol {
    func showArticle(_ articleEntity: ArticleEntity) {
        self.articleEntity = articleEntity
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        //今回はスキップ
    }
}
