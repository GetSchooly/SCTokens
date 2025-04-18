import SwiftUI
import Foundation

public var scTokenBundle: Bundle {
    Bundle.module
}

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
    let sizing3xHalf = CGFloat(14)
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
    let sizing14x = CGFloat(56)
    let sizing15x = CGFloat(60)
    let sizing16x = CGFloat(64)
    let sizing17x = CGFloat(68)
    let sizing18x = CGFloat(72)
    let sizing19x = CGFloat(76)
    let sizing20x = CGFloat(80)
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
    let show: Bool
    
    init(_ elevation: SDElevation, show: Bool) {
        self.elevation = elevation
        self.show = show
    }

    public func body(content: Content) -> some View {
        return content.shadow(color: show ? elevation.color: .clear, radius: elevation.radius, x: elevation.x, y: elevation.y)
    }
}

public extension View {
    func shadow(_ elevation: SDElevation, show: Bool = true) -> some View {
        return modifier(ApplyElevation(elevation, show: show))
    }
    
    func border(_ border: SCBorder) -> some View {
        modifier(ApplyBorder(border))
    }
}

public struct SCBorder {
    public let cornerRadius: CGFloat
    public let color: Color
    public let width: CGFloat
    
    public init(cornerRadius: CGFloat,
                color: Color,
                width: CGFloat) {
        self.cornerRadius = cornerRadius
        self.color = color
        self.width = width
    }
    
    public static var defaultBorder: SCBorder {
        SCBorder(cornerRadius: 8.0, color: .royalBlue10, width: 1.0)
    }
}

public struct ApplyBorder: ViewModifier {
    let border: SCBorder
    
    public init(_ border: SCBorder) {
        self.border = border
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: border.cornerRadius)
                    .stroke(border.color, lineWidth: border.width)
            }
    }
    
}
