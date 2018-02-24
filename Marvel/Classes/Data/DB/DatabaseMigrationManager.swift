//
//  DatabaseMigrationManager.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import RealmSwift

// Protocol

protocol DatabaseMigrationManager {
    func migrate()
}

// Implementation

class DatabaseMigrationManagerImpl: DatabaseMigrationManager {
    func migrate() {
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
    }
}

// Factory

class DatabaseMigrationManagerFactory {
    static func defaultManager() -> DatabaseMigrationManager {
        return DatabaseMigrationManagerImpl()
    }
}
