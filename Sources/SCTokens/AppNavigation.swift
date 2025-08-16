import UIKit
import SwiftUI

public class AppNavigation: ObservableObject, AppRouting {
  
    public static let shared = AppNavigation()
    @Published public var path = NavigationPath()

    public func createNavigation(_ destination: any NavigationDestination) -> UIViewController {
        return UIHostingController(rootView: AnyView(destination.view))
    }
    
    public func push(to destination: any NavigationDestination) {
        path.append(destination)
    }
    
    public func popToLast() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
}

public extension NavigationPath {
    
    mutating func push(to destination: any NavigationDestination) {
        append(destination)
    }
    
    mutating func popToLast() {
        removeLast()
    }
    
    mutating func popToRoot() {
        removeLast(self.count)
    }
}

// MARK: - NavigationPathView Model
public protocol NavigationPathManaging: AnyObject {
    var homeNavigationPath: NavigationPath { get set }
    var inboxNavigationPath: NavigationPath { get set }
    var askDoubtNavigationPath: NavigationPath { get set }
    var settingsNavigationPath: NavigationPath { get set }
}

// MARK: - EnvironmentKey for NavigationPath
private struct NavigationManagerKey: EnvironmentKey {
    static let defaultValue: NavigationPathManaging? = nil
}

extension EnvironmentValues {
    public var navigationManager: NavigationPathManaging? {
        get { self[NavigationManagerKey.self] }
        set { self[NavigationManagerKey.self] = newValue }
    }
}
