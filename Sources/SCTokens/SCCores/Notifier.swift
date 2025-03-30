import SwiftUI
import Combine

public class Notifier: ObservableObject {

    public static var shared = Notifier()
    private init() {}
    
    public func post(_ name: Notification.Name, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: name, object: nil, userInfo: userInfo)
    }
    
    public func publisher(_ name: Notification.Name) -> AnyPublisher<Notification, Never> {
        return NotificationCenter.default.publisher(for: name)
            .eraseToAnyPublisher()
    }
}

struct NotifierManaer: ViewModifier {
    let name: Notification.Name
    let action: (Notification) -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(Notifier.shared.publisher(name), perform: action)
    }
}

public extension View {
    
    func observeNotification(_ name: Notification.Name, perform action: @escaping (Notification) -> Void) -> some View {
        modifier(NotifierManaer(name: name, action: action))
    }
}
