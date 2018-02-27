//
//  MarvelError.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/27/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

enum MarvelError: Error {
    case invalidResponse
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        }
    }
}


