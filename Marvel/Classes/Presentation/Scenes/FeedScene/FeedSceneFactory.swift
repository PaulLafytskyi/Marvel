//
//  FeedSceneFactory.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import Reachability

class FeedSceneFactory {
    static func defaultFeedScene() -> FeedViewController {
        let model = FeedModel(charactersManager: CharacterManagerFactory.manager(), reachability: Reachability())
        let view = FeedViewController()
        let presenter = FeedPresenter(model: model, view: view, pagingManager: PagingManager())
        view.presenter = presenter
        model.presenter = presenter
        return view
    }
}
