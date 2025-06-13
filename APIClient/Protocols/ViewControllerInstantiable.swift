
import UIKit

protocol ViewControllerInstantiable: UIViewController {
    associatedtype Dependency

    init(dependency: Dependency, environment: EnvironmentProvider)
}

extension ViewControllerInstantiable where Dependency == Void {
    init(dependency: Dependency = (), environment: EnvironmentProvider) {
        self.init(dependency: dependency, environment: environment)
    }
}
