//
//  Codable+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/30.
//

import Foundation

#if swift(>=3.2)

// no recommended to implements Codable with Enumeration cause of it wonn't implements Decodable/Encodable by default

extension Decodable where Self: Encodable {
    public var jsonString: String? {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        }
        catch {
            return nil
        }
    }

    public var jsonObject: [String: String]? {
        do {
            let encoder = JSONEncoder()
            let decoder = JSONDecoder()
            let jsonData = try encoder.encode(self)
            return try decoder.decode(Dictionary.self, from: jsonData)
        }
        catch {
            return nil
        }
    }

    public static func modelWithJSON(json: String, decoder: JSONDecoder = JSONDecoder()) -> Self? {
        do {
            guard let jsonData = json.data(using: .utf8) else { return nil }
            let object = try decoder.decode(self, from: jsonData)
            return object
        }
        catch {
            return nil
        }
    }
}

#endif
