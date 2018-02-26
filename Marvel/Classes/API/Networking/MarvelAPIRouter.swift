//
//  MarvelAPIRouter.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import Moya

enum MarvelAPIRouter {
    case characters(offset: Int, limit: Int)
}

extension MarvelAPIRouter: TargetType {

    var baseURL: URL {
        return URL(string: Configurations().url)!
    }

    var path: String {
        return "/v1/public/characters"
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return stubbedResponse(filename: "Characters")
    }

    var task: Task {
        return.requestParameters(parameters:credentials, encoding: URLEncoding.queryString)
    }

    var credentials: [String: Any] {
        switch self {
        case .characters(let offset, let limit):
            return  CredentialsProviderFactory.provider().credentialsWithParams(keys: ["limit", "offset", "orderBy"], values: ["\(limit)", "\(offset)", "name"])
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    private func stubbedResponse(filename: String) -> Data! {
        class TestClass { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")!
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {return  data}
        return  Data()
    }
}
