//
//  DateProvider.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/18/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

protocol DateProvider {
    func currentDateInStringRepresentation() -> String
}

class ConcreteProvider: DateProvider {
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter;
    }()

    func currentDateInStringRepresentation() -> String {
        return self.dateFormatter.string(from: Date())
    }
}
