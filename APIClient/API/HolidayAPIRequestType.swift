//
//  HolidayAPIRequestType.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/13.
//　② RequestTypeを作成（APIのURLを叩く入り口みたいなもん）

import APIKit
import Foundation

protocol HolidayAPIRequestType: Request {}

extension HolidayAPIRequestType {
    var baseURL: URL {
        return URL(string: "https://holidays-jp.shogo82148.com")!
    }
    //③で作ったやつを使えるようにする
    var dataParser: DataParser {
        return JSONDataParser()
    }
}

// MARK: - Response
// ④ここでJsonからSwiftへデコードする
extension HolidayAPIRequestType where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else { throw ResponseError.unexpectedObject(object) }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(Response.self, from: data)
        } catch {
            throw ResponseError.unexpectedObject(object)
        }
    }
}
