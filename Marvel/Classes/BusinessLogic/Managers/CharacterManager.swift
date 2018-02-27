//
//  CharacterManager.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

typealias SuccessCharactersCompletionBlock = (_ characters: [Character], _ page: Page?) -> Void
typealias ErrorCompletionBlock = (Error) -> Void

protocol CharacterManager {
    var requestManager: MarvelApiRequestManager { get }
    var entitiesManager: EntitiesDatabaseManager <Character> { get }
    func downloadCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock, failure: @escaping ErrorCompletionBlock)
    func storedCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock) 
}

struct CharacterManagerImplementation: CharacterManager {
    var requestManager: MarvelApiRequestManager
    var entitiesManager: EntitiesDatabaseManager<Character>


    init(requestManager: MarvelApiRequestManager, entitiesManager: EntitiesDatabaseManager <Character>) {
        self.requestManager = requestManager
        self.entitiesManager = entitiesManager
    }

    func downloadCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock, failure: @escaping ErrorCompletionBlock)  {
        self.requestManager.getCharacters(page: page, success: { (characters, page) in
            self.entitiesManager.saveEntities(entities: characters)
            success(characters , page)
        }) { (error) in
            failure(error)
        }
    }

    func storedCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock) {
        success(self.entitiesManager.fetchSortedPagedEntities(by: "name", page: page), nil)
    }
}

class CharacterManagerFactory {
    static func manager() -> CharacterManager {
        return CharacterManagerImplementation(requestManager: MarvelApiRequestManagerFactory.defaultMarvelApiRequestManager(), entitiesManager: EntitiesDatabaseManagerFactory.defaultManager())
    }
}
