//
//  Array+Pagination.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/27/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

extension Array {

    static func slise(array: Array, limit: Int, offset: Int) -> Array {
        var pagedResult: Array = Array()

        if (offset >= array.count) {
            return pagedResult
        }

        let from = offset
        var to = offset + limit - 1

        if (from >= array.count || array.count == 0) {
            return pagedResult
        }
        if (from + limit > array.count) {
            to = array.count - 1
        }

        for index in from...to {
            pagedResult.append(array[index])
        }

        return pagedResult;
    }
}
