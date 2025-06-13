//
//  HolidayViewController.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/12.
//  
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class HolidayViewController: UIViewController {
    // MARK: - Dependency
    typealias Dependency = HolidayViewModelType

    // MARK: - Properties
    private let viewModel: Dependency
    private let environment: EnvironmentProvider
    private let disposeBag = DisposeBag()

    @IBOutlet private var datePicker: UIDatePicker!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var holidayLabel: UILabel!
    // MARK: - Initialize
    init(dependency: Dependency, environment: EnvironmentProvider) {
        self.viewModel = dependency
        self.environment = environment
        super.init(nibName: Self.className, bundle: Self.bundle)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
    }
}

// MARK: - Binding
private extension HolidayViewController {
    func bind(to viewModel: Dependency) {
        // ピッカーでの日付選択をする
        //1.ViewModelに日付を渡す
        datePicker.rx.date
            .bind(to: viewModel.inputs.selectDate)
            .disposed(by: disposeBag)
        // 検索ボタンをタップする
        // 1.ViewModelに検索ボタンを押したことを伝える
        searchButton.rx.tap.asSignal()
            .emit(to: viewModel.inputs.tapSearchButton)
            .disposed(by: disposeBag)
        // ラベルに祝日を表示
        viewModel.outputs.holidayText
            .drive(holidayLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - ViewControllerInstantiable
extension HolidayViewController: ViewControllerInstantiable {}
