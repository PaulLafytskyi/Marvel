//
//  CredentialsProvider.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/18/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import Foundation

class CredentialsProvider {
    let privateKey: String
    let publicKey: String
    let dateProvider: DateProvider

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter;
    }()

    init(privateKey: String, publicKey: String, dateProvider: DateProvider) {
        self.privateKey = privateKey
        self.publicKey = publicKey
        self.dateProvider = dateProvider
    }

    func credentials() -> [String: String] {
        let timeStamp = dateProvider.currentDateInStringRepresentation()
        return [CredentialsKeys.apikey: publicKey,
                CredentialsKeys.hash: "\(timeStamp)\(privateKey)\(publicKey)".md5(),
                CredentialsKeys.timeStamp: timeStamp]
    }

    func testedCredentials() -> String {
        let timeStamp = dateProvider.currentDateInStringRepresentation()
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        return "\(CredentialsKeys.apikey)=\(publicKey)&\(CredentialsKeys.hash)=\(hash)&\(CredentialsKeys.timeStamp)=\(timeStamp)"
    }
}

class CredentialsProviderFactory {
    static func provider() -> CredentialsProvider {
        return CredentialsProvider(privateKey: Configurations().privateKey, publicKey: Configurations().publicKey, dateProvider: ConcreteProvider())
    }
}


extension String {
    func md5() -> String {
        let messageData = self.data(using: .utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))

        _ = digestData.withUnsafeMutableBytes { digestBytes in
            messageData.withUnsafeBytes { messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData.map { String(format: "%02hhx", $0) }.joined()
    }

}
