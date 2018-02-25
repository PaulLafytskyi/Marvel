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
    func numberOfRow() -> Int
    func dataAtIndex(index: Int) -> Character?
}

protocol FeedModelPresenter: AnyObject {
    func newDataAppear(data: [Character])
}

class FeedPresenter: FeedViewPresenter, FeedModelPresenter {
    unowned var view: FeedView
    var model: FeedModel
    var list: [Character] = [Character]()
    
    init(model: FeedModel, view: FeedView) {
        self.model = model
        self.view = view
    }

    func viewDidReady() {
        model.getRemoteCharacters(limit: 100, offset: 0)
    }

    func numberOfRow() -> Int {
        return list.count
    }

    func dataAtIndex(index: Int) -> Character? {
        return list[index]
    }

    func newDataAppear(data: [Character]) {
        list.append(contentsOf: data)
        DispatchQueue.main.async {
            self.view.makeUpdate()
        }
    }
}


