//
//  Character.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class Character: Object, Mappable {

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var descriptions: String?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        descriptions <- map["descriptions"]
    }
}
