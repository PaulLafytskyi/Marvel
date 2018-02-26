//
//  FeedView.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import UIKit
import SnapKit

protocol FeedView: AnyObject {
    func makeUpdate()
}

class FeedViewController: UIViewController, FeedView, UITableViewDelegate, UITableViewDataSource {
    var presenter: FeedViewPresenter!
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidReady()
    }

    private func setupTableView () {
        view.addSubview(tableView)
        self.tableView.register(FeedTableViewCell.nib(), forCellReuseIdentifier: FeedTableViewCell.reuseIdentifier())
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { (make) -> Void  in
            make.edges.equalTo(view)
        }
    }

    func makeUpdate() {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.loadMoreIfNeeded(index: indexPath.row)
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseIdentifier()) as! FeedTableViewCell
        let character = presenter.dataAtIndex(index: indexPath.row)
        cell.nameLabel.text = character?.name
        return cell
    }
}
