//
//  FeedPresenter.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

protocol FeedViewPresenter {
    func viewDidReady()
    func loadMoreIfNeeded(index: Int)
    func numberOfRow() -> Int
    func dataAtIndex(index: Int) -> Character?
}

protocol FeedModelPresenter: AnyObject {
    func newDataAppear(data: [Character], page: Page?)
    func failedToLoadData()
    func connectionStatusDidChange(_ available: Bool)
}

class FeedPresenter: FeedViewPresenter, FeedModelPresenter, PaginationDelegate {
    var page = Page(limit: Pagination.limit, offset: 0)
    var isOnline = true

    //MARK: - Init

    unowned var view: FeedView
    var pagingManager: PagingManager
    var model: FeedModel
    var list: [Character] = [Character]()
    
    init(model: FeedModel, view: FeedView, pagingManager: PagingManager) {
        self.model = model
        self.view = view
        self.pagingManager = pagingManager
        self.pagingManager.delegate = self
    }

    //MARK: - FeedViewPresenter

    func viewDidReady() {
        pagingManager.initialLoad()
    }

    func loadMoreIfNeeded(index: Int) {
        pagingManager.loadMoreIfNeeded(currentIndex: index, itemsInRow: 1)
    }

    func numberOfRow() -> Int {
        return list.count
    }

    func dataAtIndex(index: Int) -> Character? {
        return list[index]
    }

    // MARK: - FeedModelPresenter

    func newDataAppear(data: [Character], page: Page?) {
        list.append(contentsOf: data)
        if let page = page  {
            pagingManager.updateCurrentPage(page)
            pagingManager.enableLoading()
        }
        DispatchQueue.main.async {
            self.view.makeUpdate()
        }
    }

    func failedToLoadData() {
        pagingManager.enableLoading()
    }

    func connectionStatusDidChange(_ available: Bool) {
        isOnline = available
        if (!available && list.count == 0) {
            getMoreItemsFromBackend(page: Page(limit: Pagination.limit, offset: 0))
        }
    }

    // MARK: - PaginationDelegate

    func getMoreItemsFromBackend(page: Page) {
        pagingManager.stopLoading()
        if (isOnline) {
            model.getRemoteCharacters(page: page)
        }
        else {
            model.getStoredCharacters(page: page)
        }
    }
}


