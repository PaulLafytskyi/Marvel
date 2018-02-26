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
    var count: Int {
        return offset + limit
    }

    init() {
    }

    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
    }

    func mutateToNext() {
        self.offset += self.limit
    }
}
