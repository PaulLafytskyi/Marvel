// MARK: - Mocks generated from file: Marvel/Classes/Common/DateProvider/DateProvider.swift at 2018-02-25 16:56:12 +0000

//
//  DateProvider.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/18/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Cuckoo
@testable import Marvel

import Foundation

class MockDateProvider: DateProvider, Cuckoo.Mock {
    typealias MocksType = DateProvider
    typealias Stubbing = __StubbingProxy_DateProvider
    typealias Verification = __VerificationProxy_DateProvider
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: DateProvider?

    func spy(on victim: DateProvider) -> Self {
        observed = victim
        return self
    }

    

    

    
    // ["name": "currentDateInStringRepresentation", "returnSignature": " -> String", "fullyQualifiedName": "currentDateInStringRepresentation() -> String", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "String", "isOptional": false, "stubFunction": "Cuckoo.StubFunction"]
     func currentDateInStringRepresentation()  -> String {
        
            return cuckoo_manager.call("currentDateInStringRepresentation() -> String",
                parameters: (),
                original: observed.map { o in
                    return { (args) -> String in
                        let () = args
                        return o.currentDateInStringRepresentation()
                    }
                })
        
    }
    

    struct __StubbingProxy_DateProvider: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func currentDateInStringRepresentation() -> Cuckoo.StubFunction<(), String> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("currentDateInStringRepresentation() -> String", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_DateProvider: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func currentDateInStringRepresentation() -> Cuckoo.__DoNotUse<String> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("currentDateInStringRepresentation() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class DateProviderStub: DateProvider {
    

    

    
     func currentDateInStringRepresentation()  -> String {
        return DefaultValueRegistry.defaultValue(for: String.self)
    }
    
}



class MockConcreteProvider: ConcreteProvider, Cuckoo.Mock {
    typealias MocksType = ConcreteProvider
    typealias Stubbing = __StubbingProxy_ConcreteProvider
    typealias Verification = __VerificationProxy_ConcreteProvider
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ConcreteProvider?

    func spy(on victim: ConcreteProvider) -> Self {
        observed = victim
        return self
    }

    

    

    
    // ["name": "currentDateInStringRepresentation", "returnSignature": " -> String", "fullyQualifiedName": "currentDateInStringRepresentation() -> String", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "String", "isOptional": false, "stubFunction": "Cuckoo.StubFunction"]
     override func currentDateInStringRepresentation()  -> String {
        
            return cuckoo_manager.call("currentDateInStringRepresentation() -> String",
                parameters: (),
                original: observed.map { o in
                    return { (args) -> String in
                        let () = args
                        return o.currentDateInStringRepresentation()
                    }
                })
        
    }
    

    struct __StubbingProxy_ConcreteProvider: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func currentDateInStringRepresentation() -> Cuckoo.StubFunction<(), String> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("currentDateInStringRepresentation() -> String", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ConcreteProvider: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func currentDateInStringRepresentation() -> Cuckoo.__DoNotUse<String> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("currentDateInStringRepresentation() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ConcreteProviderStub: ConcreteProvider {
    

    

    
     override func currentDateInStringRepresentation()  -> String {
        return DefaultValueRegistry.defaultValue(for: String.self)
    }
    
}



