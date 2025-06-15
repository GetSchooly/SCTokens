import Security
import Foundation

/**
 Example usage:
 
 *** Save/Delete/Read -- Strings
 
 Keychain.shared.saveString("abc123", forKey: "token")

 let token = Keychain.shared.readString(forKey: "token")

 Keychain.shared.deleteString(forKey: "token")

 
 *** Save/Delete/Read -- Codable
 
 struct UserSession: Codable {
     let userId: String
     let token: String
 }

 let session = UserSession(userId: "42", token: "xyz")

 Keychain.shared.save(session, forKey: "session")
 Keychain.shared.read(UserSession.self, forKey: "session")
 Keychain.shared.delete(UserSession.self, forKey: "session")

 
 */

public enum KeychainError: Error, LocalizedError {
    case itemNotFound
    case duplicateItem
    case unexpectedStatus(OSStatus)
    case encodingFailed
    case decodingFailed

    public var errorDescription: String? {
        switch self {
        case .itemNotFound: return "Item not found in Keychain."
        case .duplicateItem: return "Item already exists in Keychain."
        case .unexpectedStatus(let status): return "Unexpected Keychain error: \(status)."
        case .encodingFailed: return "Failed to encode the item."
        case .decodingFailed: return "Failed to decode the item."
        }
    }
}

public final class Keychain {
    public static let shared = Keychain()
    
    private init() {}
    
    public enum Keys: String {
        case token = "AccessToken"
        case userProfile = "UserProfile"
        case emailId = "EmailId"
    }
    
    // MARK: - Codable (Generic)
    public func save<T: Codable>(_ item: T, forKey key: Keys) -> Result<Void, KeychainError> {
        guard let data = try? JSONEncoder().encode(item) else {
            return .failure(.encodingFailed)
        }
        return save(data: data, forKey: key)
    }
    
    public func read<T: Codable>(_ type: T.Type, forKey key: Keys) -> Result<T, KeychainError> {
        switch readData(forKey: key) {
        case .success(let data):
            guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                return .failure(.decodingFailed)
            }
            return .success(decoded)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func delete<T: Codable>(_ type: T.Type, forKey key: Keys) -> Result<Void, KeychainError> {
        delete(forKey: key)
    }
    
    // MARK: - String Helpers
    public func saveString(_ value: String, forKey key: Keys) -> Result<Void, KeychainError> {
        guard let data = value.data(using: .utf8) else {
            return .failure(.encodingFailed)
        }
        return save(data: data, forKey: key)
    }
    
    public func readString(forKey key: Keys) -> Result<String, KeychainError> {
        switch readData(forKey: key) {
        case .success(let data):
            guard let string = String(data: data, encoding: .utf8) else {
                return .failure(.decodingFailed)
            }
            return .success(string)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    // MARK: - Raw Data
    public func save(data: Data, forKey key: Keys) -> Result<Void, KeychainError> {
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String  : data
        ]
        
        SecItemDelete(query as CFDictionary) // Remove if exists
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
        ? .success(())
        : .failure(.unexpectedStatus(status))
    }
    
    public func readData(forKey key: Keys) -> Result<Data, KeychainError> {
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String : true,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]
        
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status != errSecItemNotFound else { return .failure(.itemNotFound) }
        guard status == errSecSuccess, let data = result as? Data else {
            return .failure(.unexpectedStatus(status))
        }
        
        return .success(data)
    }
    
    public func delete(forKey key: Keys) -> Result<Void, KeychainError> {
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        return (status == errSecSuccess || status == errSecItemNotFound)
        ? .success(())
        : .failure(.unexpectedStatus(status))
    }
}
