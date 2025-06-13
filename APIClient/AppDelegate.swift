//
//  AppDelegate.swift
//  APIClient
//
//  Created by Yusei Tsumori on 2025/06/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let environment = makeEnvironment()
        window = environment.window as? UIWindow
        let holidayRepository = SearchHolidayRepository(apiClient: APIClient())
        let holidayViewModel = HolidayViewModel(searchHolidayRepository: holidayRepository)
        window?.rootViewController = HolidayViewController(dependency: holidayViewModel, environment: environment)
        window?.makeKeyAndVisible()
        return true
    }
}

// MARK: - Private method
private extension AppDelegate {
    func makeEnvironment() -> EnvironmentProvider {
        let window = UIWindow()
        let environment = Environment(window: window)
        return environment
    }
}

