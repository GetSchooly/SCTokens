import UIKit

public enum AppBundle {
    case signIn
    case parent
    case school
    case main
    
    public var bundle: Bundle? {
        switch self {
        case .signIn:
            return Bundle(identifier: "com.app.SignIn")
        case .parent:
            return Bundle(identifier: "com.app.Parent")
        case .school:
            return Bundle(identifier: "com.app.SignIn")
        case .main:
            return Bundle.main
        }
    }
}

public extension UIViewController {
    class func loadFromNib<T: UIViewController>(bundle: AppBundle? = nil) -> T {
        return T(nibName: String(describing: self), bundle: bundle?.bundle)
    }
}
