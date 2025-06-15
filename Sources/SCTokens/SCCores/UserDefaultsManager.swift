import Foundation

public final class UserDefaultsManager {
    
    public static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard

    private init() {}

    // MARK: - Keys
    private enum Keys {
        static let isLoggedIn = "isLoggedIn"
        static let lastLoginDate = "lastLoginDate"
    }

    // MARK: - Stored Properties
    public var isLoggedIn: Bool {
        get { defaults.bool(forKey: Keys.isLoggedIn) }
        set { defaults.set(newValue, forKey: Keys.isLoggedIn) }
    }

    public var lastLoginDate: Date? {
        get { defaults.object(forKey: Keys.lastLoginDate) as? Date }
        set { defaults.set(newValue, forKey: Keys.lastLoginDate) }
    }

    // MARK: - Clear User or All
    public func clearUserData() {
        defaults.removeObject(forKey: Keys.isLoggedIn)
        defaults.removeObject(forKey: Keys.lastLoginDate)
    }
    
    public func clearAll() {
        for key in defaults.dictionaryRepresentation().keys {
            defaults.removeObject(forKey: key)
        }
    }
}
