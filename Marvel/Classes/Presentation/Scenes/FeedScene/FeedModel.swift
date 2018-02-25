//
//  FeedModel.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

class FeedModel {
    var charactersManager: CharacterManager
    weak var presenter: FeedModelPresenter?

    init(charactersManager: CharacterManager) {
        self.charactersManager = charactersManager
    }

    func getRemoteCharacters(limit: Int, offset: Int) {
        
        charactersManager.downloadCharacters(page: Page(limit: limit, offset: offset), success: { [weak self] (characterList) in
            guard let stronself = self else { return }
            stronself.presenter?.newDataAppear(data: characterList)
        }) { (error) in
            // Notify Error
        }
    }
}
