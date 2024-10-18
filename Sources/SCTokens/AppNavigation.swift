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

//
//public extension View {
//    func parentNavigationDestination() -> some View {
//        navigationDestination(for: (any NavigationDestination).) { destination in
//            destination.
//        }
//    }
//}
