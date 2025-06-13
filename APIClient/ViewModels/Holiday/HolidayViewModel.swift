//
//  HolidayViewModel.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/12.
//  
//

import Action
import RxSwift
import RxCocoa
import Foundation

protocol HolidayViewModelInput: AnyObject {
    var tapSearchButton: PublishRelay<Void> { get }
    var selectDate: PublishRelay<Date> { get }
}

protocol HolidayViewModelOutput: AnyObject {
    var holidayText: Driver<String> { get }
}

protocol HolidayViewModelType: AnyObject {
    var inputs: HolidayViewModelInput { get }
    var outputs: HolidayViewModelOutput { get }
}

final class HolidayViewModel: HolidayViewModelType {
    // MARK: - Inputs Sources
    let tapSearchButton: PublishRelay<Void> = .init()
    let selectDate: PublishRelay<Date> = .init()
    // MARK: - Outputs Sources
    let holidayText: Driver<String>
    // MARK: - Properties
    var inputs: HolidayViewModelInput { return self }
    var outputs: HolidayViewModelOutput { return self }
    
    private let searchHolidayAction: Action<Date, Holidays>
    private let disposeBag = DisposeBag()

    // MARK: - Initialize
       init(searchHolidayRepository: SearchHolidayRepositoryProtocol) {
           self.searchHolidayAction = .init { date in
               searchHolidayRepository.fetchSearchResult(date: date)
           }
           
           let result = searchHolidayAction.elements.share(replay: 1)
           //成功した時
           self.holidayText = result
               .map { $0.holidays.first.map { "\($0.name)🎉"} ?? "祝日じゃないよ😢" }
               .asDriver(onErrorDriveWith: .empty())
           //検索ボタンをタップした時
           tapSearchButton.withLatestFrom(selectDate)
               .bind(to: searchHolidayAction.inputs)
               .disposed(by: disposeBag)
       }}

// MARK: - HolidayViewModelInput
extension HolidayViewModel: HolidayViewModelInput {}

// MARK: - HolidayViewModelOutput
extension HolidayViewModel: HolidayViewModelOutput {}
