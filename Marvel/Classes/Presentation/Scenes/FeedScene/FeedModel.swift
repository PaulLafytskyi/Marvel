//
//  FeedModel.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation
import Reachability

class FeedModel {
    var charactersManager: CharacterManager
    var reachability: Reachability?
    weak var presenter: FeedModelPresenter?

    init(charactersManager: CharacterManager, reachability: Reachability?) {
        self.charactersManager = charactersManager
        self.reachability = reachability
        startReachabilityWork()
    }

    func getRemoteCharacters(page: Page) {
        charactersManager.downloadCharacters(page: page, success: { [weak self] (characterList, page) in
            guard let stronself = self else { return }
            stronself.presenter?.newDataAppear(data: characterList, page: page)
        }) { [weak self] (error) in
            guard let stronself = self else { return }
            stronself.presenter?.failedToLoadData()
        }
    }

    func getStoredCharacters(page: Page) {
        self.charactersManager.storedCharacters(page: page) { [weak self] (characterList, _) in
            guard let stronself = self else { return }
            stronself.presenter?.newDataAppear(data: characterList, page: page)
        }
    }

    func isReachable() -> Bool {
        return reachability?.connection == .none
    }

    func startReachabilityWork() {
        guard let reachability = reachability else { return; }
        reachability.whenReachable = { [weak self] reachability in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.connectionStatusDidChange(true)
        }
        reachability.whenUnreachable = {[weak self]  _ in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.connectionStatusDidChange(false)
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}
