import SwiftUI

public extension View {
    func getContentSize(completion: @escaping (CGSize) -> Void) -> some View  {
        self.background(
            GeometryReader(content: { proxy in
                Color.clear.preference(key: ContentSizeKey.self, value: proxy.size)
            })
        )
        .onPreferenceChange(ContentSizeKey.self) { value in
            completion(value)
        }
    }
}

struct ContentSizeKey: PreferenceKey {
    typealias Value = CGSize
    static let defaultValue: Value = .zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.height += nextValue().height
        value.width += nextValue().width
    }
}



private struct MainWindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

public extension EnvironmentValues {
    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }
}
