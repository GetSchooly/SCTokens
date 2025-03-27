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
