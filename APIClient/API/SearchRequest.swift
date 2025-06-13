//
//  SearchRequest.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/13.
// ⑥今回のAPIを呼んでいるところ

import APIKit
import Foundation

extension HolidayAPI.Search {
    struct Get: HolidayAPIRequestType {
        // MARK: - Response
        typealias Response = Holidays
        
        // MARK: - Properties
        let path: String
        let method: HTTPMethod = .get
        
        // MARK: - Initialize
        init(path: String) {
            self.path = path
        }
    }
}
