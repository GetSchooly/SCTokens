import Foundation

public enum IconSize {
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case XXLarge
    case custom(width: CGFloat, height: CGFloat)
    
    public var width: CGFloat {
        switch self {
        case .extraSmall:
            Sizing.sizing3x
        case .small:
            Sizing.sizing4x
        case .medium:
            Sizing.sizing5x
        case .large:
            Sizing.sizing6x
        case .extraLarge:
            Sizing.sizing7x
        case .XXLarge:
            Sizing.sizing8x
        case .custom(let width, _):
            width
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .extraSmall:
            Sizing.sizing3x
        case .small:
            Sizing.sizing4x
        case .medium:
            Sizing.sizing5x
        case .large:
            Sizing.sizing6x
        case .extraLarge:
            Sizing.sizing7x
        case .XXLarge:
            Sizing.sizing8x
        case .custom(_, let height):
            height
        }
    }
}
