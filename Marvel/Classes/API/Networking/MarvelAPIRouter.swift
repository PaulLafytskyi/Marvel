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
        return "/v1/public/characters/"
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return.requestParameters(parameters:credentials, encoding: URLEncoding.default)
    }

    var credentials: [String: Any] {
        return CredentialsProviderFactory.provider().credentials()
    }

    var headers: [String : String]? {
        return nil
    }
}

