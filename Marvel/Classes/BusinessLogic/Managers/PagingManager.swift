//
//  PagingManager.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

struct Pagination {
    static let limit: Int = 30
}

protocol PaginationDelegate: AnyObject {
    func getMoreItemsFromBackend(page: Page)
}

class PagingManager: NSObject {
    var page: Page = Page(limit: Pagination.limit, offset: 0)
    var shouldLoadMore = true
    weak var delegate: PaginationDelegate?

    func updateCurrentPage(_ page: Page) {
        self.page = page
    }

    func loadMoreIfNeeded(currentIndex: Int, itemsInRow: Int) {
        if !shouldLoadMore {
            return
        }

        var indexToCompare = page.count - 1

        if itemsInRow > 1 {
            let count: Double = Double(page.count) / Double(itemsInRow)
            let numberOfRows = ceil(count)
            indexToCompare = Int(numberOfRows) - 1
        }

        if (currentIndex == indexToCompare && page.count >= Pagination.limit) {
            let featureOffset = (page.offset == 0) ? Pagination.limit : Pagination.limit + page.offset
            delegate?.getMoreItemsFromBackend(page: Page(limit: Pagination.limit, offset: featureOffset))
        }
    }

    func initialLoad() {
        delegate?.getMoreItemsFromBackend(page: Page(limit: Pagination.limit, offset: 0))
    }

    func stopLoading() {
        shouldLoadMore = false
    }

    func enableLoading() {
        shouldLoadMore = true
    }
}
