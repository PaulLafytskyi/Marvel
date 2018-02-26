//
//  EntitiesManager.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import RealmSwift

struct EntitiesDatabaseManager <T: Object> {
    private let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func clear() {
        try! realm.write {
            self.realm.delete(self.realm.objects(T.self))
        }
    }

    func saveEntities(entities: [T]) {
        try! realm.write {
            self.realm.add(entities, update: true)
            //self.realm.add(entities)
        }
    }

    func fetchSortedPagedEntities(by: String, page: Page) -> [T] {
        let result = Array(realm.objects(T.self).sorted(by: [SortDescriptor(keyPath: by, ascending: true)]))
        if (page.offset >= result.count) {
            return [T]()
        }
        var pagedResult: [T] = [T]()

        let from = page.offset
        var to = page.offset + page.limit - 1
        if (from >= result.count || result.count == 0) {
            return pagedResult
        }
        if (result.count < from + to) {
            to = result.count - 1
        }

        for index in from...to {
            pagedResult.append(result[index])
        }
        return pagedResult;
    }

    func fetchAllEntities() -> [T] {
        return Array(realm.objects(T.self))
    }

    func fetchFirstEntity() -> T? {
        return realm.objects(T.self).first
    }
    
}

// MARK:- EntitiesDatabaseManager Factory

class EntitiesDatabaseManagerFactory {
    static func defaultManager<T: Object>() -> EntitiesDatabaseManager<T> {
        return EntitiesDatabaseManager(realm: try! Realm())
    }
}

