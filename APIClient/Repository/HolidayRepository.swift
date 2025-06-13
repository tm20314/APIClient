//
//  HolidayRepository.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/13.
//

import Foundation
import RxSwift

protocol SearchHolidayRepositoryProtocol: AnyObject {
    func fetchSearchResult(date: Date) -> Single<Holidays>
}

final class SearchHolidayRepository: SearchHolidayRepositoryProtocol {
    // MARK: - Properties
    private let apiClient: APIClientProtocol
    // MARK: - Initialize
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    //ViewModelから受け取った日付(date)をもとに処理を開始
    func fetchSearchResult(date: Date) -> Single<Holidays> {
        //フォーマットでyyyy/mm//ddに変換
        let pathString = DateFormatter.yearMonthDayWithPaddingSeparator.string(from: date)
        //APIリクエストのインスタンスを作成
        let request = HolidayAPI.Search.Get(path: pathString)
        //リクエストをapiCliantに渡して実行する
        return apiClient.response(request)
    }
}
