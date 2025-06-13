//
//  APICliant.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/13.
//

import APIKit
import Foundation
import RxSwift

final class APIClient: APIClientProtocol {
    func response<Request: HolidayAPIRequestType>(_ request: Request) -> Single<
        Request.Response> {
        return .create { observer in
            let task = Session.shared.send(request) { result in
                switch result {
                case let .success(response):
                    //成功した時
                    observer(.success(response))
                case let .failure(error):
                    //失敗した時
                    observer(.failure(error))
                }
            }
            return Disposables.create {
                task?.cancel()
            }
        }
    }
}
