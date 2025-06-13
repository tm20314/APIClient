//
//  Holiday.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/12.
//　①構造体を作成

import Foundation

struct Holiday: Decodable {
    let date: String
    let name: String
}

struct Holidays: Decodable {
    let holidays: [Holiday]
}
