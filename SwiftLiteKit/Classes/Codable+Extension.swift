//
//  Codable+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/30.
//

import Foundation

//#if swift(>=4)

extension Decodable where Self: Encodable {
    static var encoder: JSONEncoder { return JSONEncoder() }
    static var decoder: JSONDecoder { return JSONDecoder() }

    public var jsonString: String? {
        do {
            let jsonData = try Self.encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }

    public static func modelWithJSON(json: String) -> Self? {
        do {
            guard let jsonData = json.data(using: .utf8) else { return nil }
            let object = try decoder.decode(self, from: jsonData)
            return object
        } catch {
            return nil
        }

    }
}

//#endif

