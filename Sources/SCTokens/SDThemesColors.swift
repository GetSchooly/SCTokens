import SwiftUI

public extension Color {
    static let primaryBackground = Color(red: 0/225, green: 119/225, blue: 182/225)
    
    static let primaryText = Color.black
    static let primarySubText = primaryBackground
    static let secondryText = Color(red: 101/225, green: 101/225, blue: 101/225)
    
    static let buttonPrimaryText = Color.white
    static let buttonPrimarySubText = primaryBackground
    static let buttonSecondryText = primaryText
    static let buttonPrimaryBackground = primaryBackground
    static let buttonSecondryBackground = buttonPrimaryText
    
    static let textFieldBackground = Color(red: 255/225, green: 255/225, blue: 255/225)
    
    static let primaryBorder = primaryBackground
    
    static let grayStroke = Color.gray.opacity(0.5)
    static let placholder = Color.gray.opacity(0.7)
    static let error = Color(red: 191/225, green: 21/225, blue: 4/225)
}
