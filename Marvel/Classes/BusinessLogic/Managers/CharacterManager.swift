//
//  CharacterManager.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

typealias SuccessCharactersCompletionBlock = ([Character]) -> Void
typealias ErrorCompletionBlock = (Error) -> Void

protocol CharacterManager {
    var requestManager: MarvelApiRequestManager { get }
    var entitiesManager: EntitiesDatabaseManager <Character> { get }
    func downloadCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock, failure: ErrorCompletionBlock)
}

struct CharacterManagerImplementation: CharacterManager {
    var requestManager: MarvelApiRequestManager
    var entitiesManager: EntitiesDatabaseManager<Character>


    init(requestManager: MarvelApiRequestManager, entitiesManager: EntitiesDatabaseManager <Character>) {
        self.requestManager = requestManager
        self.entitiesManager = entitiesManager
    }

    func downloadCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock, failure: ErrorCompletionBlock)  {
        self.requestManager.getCharacters(page: page, success: { (characters) in
            self.entitiesManager.saveEntities(entities: characters)
            success(characters)
        }) { (error) in
            // TODO: Notify Error
        }
    }
}

class CharacterManagerFactory {
    static func manager() -> CharacterManager {
        return CharacterManagerImplementation(requestManager: MarvelApiRequestManagerFactory.defaultMarvelApiRequestManager(), entitiesManager: EntitiesDatabaseManagerFactory.defaultManager())
    }
}
