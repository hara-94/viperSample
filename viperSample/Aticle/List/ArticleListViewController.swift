//
//  AticleListViewContrller.swift
//  viperSample
//
//  Created by hikaruhara on 2020/11/06.
//

import UIKit

final class ArticleListViewController: UIViewController {
    private let tableView: UITableView = .init()
    private var articleEntities: [ArticleEntity] = []
    var presenter: ArticleListPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        
        setTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.didSelect(articleEntity: articleEntities[indexPath.row])
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articleEntities[indexPath.row].title
        return cell
    }
}

private extension ArticleListViewController {
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


extension ArticleListViewController: ArticleListViewProtocol {
    func showArticles(_ articleEntities: [ArticleEntity]) {
        self.articleEntities = articleEntities
        tableView.reloadData()
    }
    
    func showEmpty() {
        showArticles([])
    }
    
    func showError(_ error: Error) {
        //今回はスキップ
    }
}
