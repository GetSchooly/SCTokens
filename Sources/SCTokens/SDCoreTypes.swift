import SwiftUI
import Foundation

public struct CornerRadius {
    private init() {}
}

public struct Sizing {
    private init() {}
}

public struct Spacing {
    private init() {}
}

public struct Opacity {
    private init() {}
}

public struct SDDuration {
    private init() {}
}

public struct TextDecoration {
    private init() {}
}

class SDDdefaultTokenEntryPoint {
    static var tokenSource: SDNumbers = SDNumbers()
}

struct SDNumbers {
    let sizing0x = CGFloat(0)
    let sizing0xQuarter = CGFloat(1)
    let sizing0xHalf = CGFloat(2)
    let sizing1x = CGFloat(4)
    let sizing1xHalf = CGFloat(6)
    let sizing2x = CGFloat(8)
    let sizing2xHalf = CGFloat(10)
    let sizing3x = CGFloat(12)
    let sizing4x = CGFloat(16)
    let sizing4xHalf = CGFloat(18)
    let sizing5x = CGFloat(20)
    let sizing5xHalf = CGFloat(22)
    let sizing6x = CGFloat(24)
    let sizing7x = CGFloat(28)
    let sizing8x = CGFloat(32)
    let sizing9x = CGFloat(36)
    let sizing10x = CGFloat(40)
    let sizing11x = CGFloat(44)
    let sizing12x = CGFloat(48)
    let sizing13x = CGFloat(52)
}

public enum TextDecorationType: String {
    case underline
    case lineThrough = "line-through"
    case none
}

public protocol SDCustomFontProvider {
    var bold: String { get }
    var semiBold: String { get }
    var light: String { get }
    var medium: String { get }
    var regular: String { get }

    func font(weight: Font.Weight) -> String
}

public struct SDElevation {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
    public init(x: CGFloat,
                y: CGFloat,
                radius: CGFloat,
                color: Color) {
        self.color = color
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    public static var defaultGrayElevation: SDElevation {
        SDElevation(x: 0.0, y: 0.0, radius: 10.0, color: .gray.opacity(0.2))
    }
}

public struct ApplyElevation: ViewModifier {
    let elevation: SDElevation
    
    init(_ elevation: SDElevation) {
        self.elevation = elevation
    }

    public func body(content: Content) -> some View {
        content.shadow(color: elevation.color, radius: elevation.radius, x: elevation.x, y: elevation.y)
    }
}

public extension View {
    func shadow(_ elevation: SDElevation) -> some View {
        modifier(ApplyElevation(elevation))
    }
}
