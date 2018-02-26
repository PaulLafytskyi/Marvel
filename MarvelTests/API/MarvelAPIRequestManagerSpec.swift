//
//  MarvelAPIRequestManagerSpec.swift
//  MarvelTests
//
//  Created by Poul Lafitskiy on 2/24/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Nimble
import Quick
import Cuckoo
import RealmSwift

@testable import Marvel

class MarvelAPIRequestManagerSpec: QuickSpec {

    override func spec() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "database A"

        describe("MarvelAPIRequestManager", closure: {
            var sut: MarvelApiRequestManager!
            var apiService: MarvelApiService!

            describe("When initialized", {
                beforeEach {
                    apiService = MarvelApiServiceImplementation(stubbing: true, verbose: true)
                    sut = MarvelApiRequestManagerImplementation(apiService: apiService)
                }
                describe("When ask for characters", {
                    it("Should return value", closure: {
                        var error: Error? = nil
                        waitUntil { done in
                            sut.getCharacters(page: Page(), success: { success,page  in
                                expect(success.count == 30).to(beTrue())
                                done()
                            }, failure: { failure in
                                error = failure
                                done()
                            })
                        }
                        expect(error).toEventually(beNil())
                    })
                })
            })
        })
    }
}
