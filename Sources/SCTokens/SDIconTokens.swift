import Foundation

public enum Icons: String, Codable {
    case ic_myschool_logo
    case ic_placeholder

    case ic_home
    case ic_home_sel
    case ic_profile
    case ic_profile_sel
    case ic_askDoubt
    case ic_askDoubt_sel
    case ic_inbox
    case ic_inbox_sel

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
    case ic_plusBlack
    case ic_schoolInfo
    case ic_check
    case ic_EmptyBox
    case ic_CheckedBox

    case ic_onb1
    case ic_onb2
    case ic_onb3

    case ic_school
    case ic_info
    case ic_NextArrow
    case ic_ChangePassword
    case ic_Subscribe
    case ic_Support
    case ic_lang
    case ic_Logout
    case ic_Chevron_up
    case ic_Rectangle

    case ic_chat
    case ic_call

    case ic_PreviousArrowWhite
    case ic_NextArrowWhite

    case ic_cross
    case ic_downArrow

    case ic_share
    case ic_download
    case ic_festival
    case ic_late
    case ic_notMarked
    case ic_absent
    case ic_present
    case ic_na
    case ic_empty

    public var value: String {
        self.rawValue
    }
}

public extension Icons {
    enum System: String {
        case xmark

        public var value: String {
            self.rawValue
        }
    }
}

public enum IconSize {
    /// 12px
    case extraSmall
    /// 16px
    case small
    /// 20px
    case medium
    /// 24px
    case large
    /// 28px
    case extraLarge
    /// 32px
    case XXLarge
    /// custom width/height
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
