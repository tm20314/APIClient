
import Foundation

// MARK: - Properties
extension NSObject {
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var bundle: Bundle {
        return .init(for: self.self)
    }

    var className: String {
        return Self.className
    }
}
