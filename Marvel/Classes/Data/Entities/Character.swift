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

    @objc dynamic var characterID: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var descriptions: String = ""
    @objc dynamic var thumbnail: Thumbnail?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        characterID <- map["id"]
        name <- map["name"]
        descriptions <- map["description"]
        thumbnail <- map ["thumbnail"]
    }

    override static func primaryKey() -> String? {
        return "characterID"
    }
}
