//
//  MarvelApiService.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias SuccessCallback =  (_ result: Response) -> Void
typealias FailureCallback = (_ fail: Error) -> Void

// MARK:- Protocol

protocol MarvelApiService {
    var apiProvider: MoyaProvider <MarvelAPIRouter> { get }
    func request(router: MarvelAPIRouter, success: @escaping SuccessCallback, failure: @escaping FailureCallback)
}

// MARK:- Implementation

class MarvelApiServiceImplementation: MarvelApiService {
    var apiProvider: MoyaProvider <MarvelAPIRouter>

    init(stubbing: Bool, verbose: Bool) {
        self.apiProvider = MoyaProvider<MarvelAPIRouter>(plugins: [NetworkLoggerPlugin(verbose: verbose, responseDataFormatter: JSONResponseDataFormatter)])
    }

    func request(router: MarvelAPIRouter, success succes: @escaping SuccessCallback, failure: @escaping FailureCallback) {
        apiProvider.request(router) { (result) in
            switch result {
            case .success(let response):
                succes(response)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
}

// MARK:- Factory

class MarvelAPIServiceFactory {
    static func defaultMarvelApiService() -> MarvelApiService {
        return MarvelApiServiceImplementation(stubbing: false, verbose: false)
    }
}
