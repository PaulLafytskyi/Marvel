//
//  ArrayPaginationSpec.swift
//  MarvelTests
//
//  Created by Poul Lafitskiy on 2/27/18.
//  Copyright © 2018 PLF. All rights reserved.
//


import Nimble
import Quick
import Cuckoo
import RealmSwift

@testable import Marvel

class ArrayPaginationSpec: QuickSpec {

    override func spec() {

        describe("ArrayPaginationSpec", closure: {
            describe("When try to slise array ", {

                it("Calculate Page", closure: {
                    let page = Page(limit: 2, offset: 0)
                    var slisedResult = [Int]()
                    let result = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2]))
                    expect(slisedResult.count) == 2

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4]))
                    expect(slisedResult.count) == 4

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6]))
                    expect(slisedResult.count) == 6

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8]))
                    expect(slisedResult.count) == 8

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8,9,10]))
                    expect(slisedResult.count) == 10

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8,9,10,11,12]))
                    expect(slisedResult.count) == 12

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8,9,10,11,12,13,14]))
                    expect(slisedResult.count) == 14

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]))
                    expect(slisedResult.count) == 16

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]))
                    expect(slisedResult.count) == 18

                    page.offset += page.limit
                    slisedResult.append(contentsOf: Array.slise(array: result, limit: page.limit, offset: page.offset))
                    expect(slisedResult).to(contain([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18, 19,20]))
                    expect(slisedResult.count) == 20
                })
            })
            describe("When out of range", {
                it("When out of range", closure: {
                    let page = Page(limit: 2, offset: 20)
                    let result = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
                    page.offset += page.limit
                    expect(Array.slise(array: result, limit: page.limit, offset: page.offset).count) == 0
                })
            })
        })
    }
}
