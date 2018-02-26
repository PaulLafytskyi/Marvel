//
//  Thumbnail.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/26/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class Thumbnail: Object, Mappable {

    @objc dynamic var path: String = ""
    @objc dynamic var thumbnailExtension: String = ""

    var url: URL? {
        guard let imageUrl = URL(string: "\(path).\(thumbnailExtension)") else {
            return nil
        }
        return imageUrl
    }

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        path <- map["path"]
        thumbnailExtension <- map["extension"]
    }

}
