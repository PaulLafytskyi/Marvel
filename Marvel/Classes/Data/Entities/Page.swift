//
//  Page.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class Page: Mappable {

    var offset: Int = 0
    var limit: Int = 0
    var total: Int = 0
    var count: Int = 0

    required init?(map: Map) {

    }

    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }

    func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
    }
}
