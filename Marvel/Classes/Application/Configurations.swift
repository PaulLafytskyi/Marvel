//
//  Configurations.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/18/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

protocol Credentials {
    var privateKey: String { get }
    var publicKey: String { get }
}

protocol BaseUrl {
    var url: String { get }
}

// TODO: Should stored in some other way, for example http://www.splinter.com.au/2014/09/16/storing-secret-keys/

struct Configurations: Credentials, BaseUrl {
    var url: String {
        return "https://gateway.marvel.com"
    }
    var privateKey: String {
        return "59ae16a3f8bd8395809017a9dde51301386d88db"
    }

    var publicKey: String {
        return "7fb9e8c0f348d6f6e1a44ada62663ce6"
    }
}
