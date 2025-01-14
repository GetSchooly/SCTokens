import Foundation

public enum Icons: String {
    case ic_Attendance
    case ic_Events
    case ic_Exams
    case ic_Fees
    case ic_Homework
    case ic_result
    case ic_Syllabus
    case ic_Teachers
    case ic_timeTable
    case ic_back
    case ic_notification
    case ic_plus
    case ic_schoolInfo
    case ic_check
    
    case ic_onb1
    case ic_onb2
    case ic_onb3
    
    public var value: String {
        self.rawValue
    }
}

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
