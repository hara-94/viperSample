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
    
    override func loadView() {
        super.loadView()
        
        setTableView()
    }
}

extension ArticleListViewController: UITableViewDelegate { }

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
