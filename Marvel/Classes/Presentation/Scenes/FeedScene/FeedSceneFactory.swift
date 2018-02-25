//
//  FeedSceneFactory.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

class FeedSceneFactory {
    static func defaultFeedScene() -> FeedViewController {
        let model = FeedModel(charactersManager: CharacterManagerFactory.manager())
        let view = FeedViewController()
        let presenter = FeedPresenter(model: model, view: view)
        view.presenter = presenter
        model.presenter = presenter
        return view
    }
}
