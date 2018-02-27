//
//  MarvelAPIRequestManager.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import ObjectMapper



protocol MarvelApiRequestManager {
    var apiService: MarvelApiService { get }
    func getCharacters(page: Page, success: @escaping SuccessCharactersCompletionBlock, failure: @escaping ErrorCompletionBlock)
}

class MarvelApiRequestManagerImplementation: MarvelApiRequestManager {
    var apiService: MarvelApiService

    init(apiService: MarvelApiService) {
        self.apiService = apiService
    }

    func getCharacters(page: Page, success succes: @escaping SuccessCharactersCompletionBlock, failure: @escaping ErrorCompletionBlock) {
        self.apiService.request(router: .characters(offset: page.offset, limit: page.limit), success: { [weak self](response) in
            if let json = try? response.mapJSON() as! [String: Any] {
                //TODO: Remove force and generate custom error
                let data = json["data"]as![String: Any]
                let results = data["results"]
                let mapper = Mapper<Character>()
                let chars = mapper.mapArray(JSONObject: results)
                let page = self?.mapPage(data)
                succes(chars!, page)
            }

        }) { (error) in
            failure(error)
        }
    }

    private func mapPage(_ data: Any) -> Page? {
        let mapper = Mapper<Page>()
        return mapper.map(JSONObject: data)
    }
}

class MarvelApiRequestManagerFactory {
    static func defaultMarvelApiRequestManager() -> MarvelApiRequestManager {
        return MarvelApiRequestManagerImplementation(apiService: MarvelAPIServiceFactory.defaultMarvelApiService())
    }
}
