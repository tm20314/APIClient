//
//  JSONDataParser.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/13.
// ③リクエストをJSONにパースするためにJSONDataParserを作成する

import APIKit
import Foundation

final class JSONDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}
