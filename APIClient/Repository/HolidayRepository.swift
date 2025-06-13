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
    
    func fetchSearchResult(date: Date) -> Single<Holidays> {
        let pathString = DateFormatter.yearMonthDayWithPaddingSeparator.string(from: date)
        let request = HolidayAPI.Search.Get(path: pathString)
        return apiClient.response(request)
    }
}
