//
//  APIClientProtocol.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/13.
//　⑦

import APIKit
import Foundation
import RxSwift

protocol APIClientProtocol: AnyObject {
    func response<Request: HolidayAPIRequestType>(_ request: Request) -> Single<Request.Response>
}
