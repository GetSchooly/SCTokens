import SwiftUI

private struct AppColors {
    static let pantoneWhite = 0xFAFAFA
    static let royalBlue = 0x152259//0x0961F5
    static let blackColor = 0x202244
    static let darkGray = 0x545454
    static let lightGray = 0x979797
    static let lightBlue = 0xE6F3FF
}

public extension Color {
    static let appBackground = Color(hex: AppColors.pantoneWhite)
    static let blackColor = Color(hex: AppColors.blackColor)
    static let lightGray = Color(hex: AppColors.lightGray)
    
    static let royalBlue = Color(hex: AppColors.royalBlue)
    static let royalBlue10 = Color(hex: AppColors.royalBlue).opacity(0.1)
    static let lightBlue = Color(hex: AppColors.lightBlue)
    
    static let grayStroke = Color(hex: AppColors.lightGray)
    static let placholder = Color(hex: AppColors.lightGray)
    static let error = Color.red
    static let darkGray = Color(hex: AppColors.darkGray)
    static let appBlack = Color.black
    static let appwhite = Color.white
    static let pantoneWhite = appBackground
}


public extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    
    var suiColor: Color {
        Color(self)
    }
}

public extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    var uiColor: UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        
        let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        }
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
