
final class Environment: EnvironmentProvider {
    // MARK: - Properties
    let window: UIWindowProtocol

    // MARK: - Initialize
    init(window: UIWindowProtocol) {
        self.window = window
    }
}
