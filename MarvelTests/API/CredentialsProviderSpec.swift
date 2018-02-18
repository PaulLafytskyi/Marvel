//
//  CredentialsProviderSpec.swift
//  MarvelTests
//
//  Created by Poul Lafitskiy on 2/19/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Nimble
import Quick
import Cuckoo

@testable import Marvel

class CredentialsProviderSpec: QuickSpec {
    override func spec() {
        describe("CredentialsProvider") {
            var sut: CredentialsProvider!
            var dateProvider: MockConcreteProvider!

            describe("when initialized", closure: {
                beforeEach {
                    dateProvider = MockConcreteProvider()
                    sut = CredentialsProvider(privateKey: "abcd", publicKey: "1234", dateProvider: dateProvider)
                }
                describe("When ask for credentials", {
                    beforeEach {
                        stub(dateProvider, block: { (dateProvider) in
                            when(dateProvider.currentDateInStringRepresentation()).thenReturn("1")
                        })
                    }

                    it("Credentials should exist", closure: {
                        let hs = sut.credentials()[CredentialsKeys.hash]
                        expect(hs).notTo(beNil())
                    })

                    it("And should be equal", closure: {
                        let hs = sut.credentials()[CredentialsKeys.hash]
                        expect(hs!).to(equal("ffd275c5130566a2916217b101f26150"))
                    })

                    afterEach {
                        clearStubs(dateProvider)
                    }
                })
            })
        }
    }
}


