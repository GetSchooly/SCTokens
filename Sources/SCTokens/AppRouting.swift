import SwiftUI

public protocol NavigationDestination: Codable, Hashable {
    associatedtype Content: View
    @ViewBuilder var view: Content { get }
}

public protocol AppRouting {
    func createNavigation(_ destination: any NavigationDestination) -> UIViewController
    func push(to destination: any NavigationDestination)
    func popToLast()
    func popToRoot()
}
