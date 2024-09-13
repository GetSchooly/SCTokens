import CoreGraphics
import CoreText
import SwiftUI

extension Font {

    static func registerFontsFromBundle(named names: [String]) {
        let bundle: Bundle = {
            #if SWIFT_PACKAGE
            return Bundle.module
            #else
            return Bundle.main
            #endif
        }()
        let fontURLs = names.compactMap { bundle.url(forResource: $0, withExtension: "ttf") }
        
        CTFontManagerRegisterFontURLs(fontURLs as CFArray, .process, true) { errors, done in
            // CTFontManager.h points out that the CFArray, if not empty, contains CFError values.
            let errors = errors as! [CFError]
            guard errors.isEmpty else {
                preconditionFailure("Registering font failed: \(errors.map(\.localizedDescription))")
            }
            return true  // true: should continue; false: should stop
        }
    }

    public static let loadMyFonts: () = {
        
        registerFontsFromBundle(named: [
            "Urbanist-Bold",
            "Urbanist-SemiBold",
            "Urbanist-Medium",
            "Urbanist-Light",
            "Urbanist-Regular"
        ])
    }()
}

struct SDCustomFontsTokens {
    static var fontProvider: SDFontProvider = SDFontProvider()
    static var customFonts: SDCustomFonts = SDCustomFonts()
}

struct SDFontProvider: SDCustomFontProvider {
    var bold: String { return "Urbanist-Bold" }
    var light: String { return "Urbanist-Light" }
    var medium: String { return "Urbanist-Medium" }
    var semiBold: String { return "Urbanist-SemiBold" }
    var regular: String { return "Urbanist-Regular" }

    func font(weight: Font.Weight) -> String {
        switch weight {
        case .bold:
            return bold
        case .light:
            return light
        case .regular:
            return regular
        case .medium:
            return medium
        case .semibold:
            return semiBold
        default:
            return ""
        }
    }
}

protocol SDCustomFontsType {
    var font50Light: Font { get }
    var font75Light: Font { get }
    var font100Light: Font { get }
    var font200Light: Font { get }
    var font300Light: Font { get }
    var font400Light: Font { get }

    var font50Regular: Font { get }
    var font75Regular: Font { get }
    var font100Regular: Font { get }
    var font200Regular: Font { get }
    var font300Regular: Font { get }
    var font400Regular: Font { get }

    var font50Medium: Font { get }
    var font75Medium: Font { get }
    var font100Medium: Font { get }
    var font200Medium: Font { get }
    var font300Medium: Font { get }
    var font400Medium: Font { get }

    var font50SemiBold: Font { get }
    var font75SemiBold: Font { get }
    var font100SemiBold: Font { get }
    var font200SemiBold: Font { get }
    var font300SemiBold: Font { get }
    var font400SemiBold: Font { get }

    var font50Bold: Font { get }
    var font75Bold: Font { get }
    var font100Bold: Font { get }
    var font200Bold: Font { get }
    var font300Bold: Font { get }
    var font400Bold: Font { get }
}


struct SDCustomFonts: SDCustomFontsType {
    /// raw SD value font__50__Light
    var font50Light: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.light, size: SDDdefaultTokenEntryPoint.tokenSource.sizing2x)
    }
    /// raw SD value font__75__Light
    var font75Light: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.light, size: SDDdefaultTokenEntryPoint.tokenSource.sizing3x)
    }
    /// raw SD value font__100__Light
    var font100Light: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.light, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4x)
    }
    /// raw SD value font__200__Light
    var font200Light: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.light, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4xHalf)
    }
    /// raw SD value font__300__Light
    var font300Light: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.light, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5x)
    }
    /// raw SD value font__400__Light
    var font400Light: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.light, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5xHalf)
    }


    /// raw SD value font__50__regular
    var font50Regular: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.regular, size: SDDdefaultTokenEntryPoint.tokenSource.sizing2x)
    }
    /// raw SD value font__75__regular
    var font75Regular: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.regular, size: SDDdefaultTokenEntryPoint.tokenSource.sizing3x)
    }
    /// raw SD value font__100__regular
    var font100Regular: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.regular, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4x)
    }
    /// raw SD value font__200__regular
    var font200Regular: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.regular, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4xHalf)
    }
    /// raw SD value font__300__regular
    var font300Regular: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.regular, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5x)
    }
    /// raw SD value font__400__regular
    var font400Regular: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.regular, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5xHalf)
    }

    /// raw SD value font__50__Medium
    var font50Medium: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.medium, size: SDDdefaultTokenEntryPoint.tokenSource.sizing2x)
    }
    /// raw SD value font__75__Medium
    var font75Medium: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.medium, size: SDDdefaultTokenEntryPoint.tokenSource.sizing3x)
    }
    /// raw SD value font__100__Medium
    var font100Medium: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.medium, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4x)
    }
    /// raw SD value font__200__Medium
    var font200Medium: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.medium, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4xHalf)
    }
    /// raw SD value font__300__Medium
    var font300Medium: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.medium, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5x)
    }
    /// raw SD value font__400__Medium
    var font400Medium: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.medium, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5xHalf)
    }


    /// raw SD value font__50__SemiBold
    var font50SemiBold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.semiBold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing2x)
    }
    /// raw SD value font__75__SemiBold
    var font75SemiBold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.semiBold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing3x)
    }
    /// raw SD value font__100__SemiBold
    var font100SemiBold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.semiBold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4x)
    }
    /// raw SD value font__200__SemiBold
    var font200SemiBold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.semiBold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4xHalf)
    }
    /// raw SD value font__300__SemiBold
    var font300SemiBold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.semiBold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5x)
    }
    /// raw SD value font__400__SemiBold
    var font400SemiBold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.semiBold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5xHalf)
    }


    /// raw SD value font__50__Bold
    var font50Bold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.bold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing2x)
    }
    /// raw SD value font__75__Bold
    var font75Bold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.bold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing3x)
    }
    /// raw SD value font__100__Bold
    var font100Bold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.bold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4x)
    }
    /// raw SD value font__200__Bold
    var font200Bold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.bold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing4xHalf)
    }
    /// raw SD value font__300__Bold
    var font300Bold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.bold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5x)
    }
    /// raw SD value font__400__Bold
    var font400Bold: Font {
        return Font.custom(SDCustomFontsTokens.fontProvider.bold, size: SDDdefaultTokenEntryPoint.tokenSource.sizing5xHalf)
    }
}

public extension Font {
    
    static var font50Light: Font {
        return SDCustomFontsTokens.customFonts.font50Light
    }
    
    static var font75Light: Font {
        return SDCustomFontsTokens.customFonts.font75Light
    }
    
    static var font100Light: Font {
        return SDCustomFontsTokens.customFonts.font100Light
    }
    
    static var font200Light: Font {
        return SDCustomFontsTokens.customFonts.font200Light
    }
    
    static var font300Light: Font {
        return SDCustomFontsTokens.customFonts.font300Light
    }
    
    static var font400Light: Font {
        return SDCustomFontsTokens.customFonts.font400Light
    }
    
    static var font50Regular: Font {
        return SDCustomFontsTokens.customFonts.font50Regular
    }
    
    static var font75Regular: Font {
        return SDCustomFontsTokens.customFonts.font75Regular
    }
    
    static var font100Regular: Font {
        return SDCustomFontsTokens.customFonts.font100Regular
    }
    
    static var font200Regular: Font {
        return SDCustomFontsTokens.customFonts.font200Regular
    }
    
    static var font300Regular: Font {
        return SDCustomFontsTokens.customFonts.font300Regular
    }
    
    static var font400Regular: Font {
        return SDCustomFontsTokens.customFonts.font400Regular
    }
    
    static var font50Medium: Font {
        return SDCustomFontsTokens.customFonts.font50Medium
    }
    
    static var font75Medium: Font {
        return SDCustomFontsTokens.customFonts.font75Medium
    }
    
    static var font100Medium: Font {
        return SDCustomFontsTokens.customFonts.font100Medium
    }
    
    static var font200Medium: Font {
        return SDCustomFontsTokens.customFonts.font200Medium
    }
    
    static var font300Medium: Font {
        return SDCustomFontsTokens.customFonts.font300Medium
    }
    
    static var font400Medium: Font {
        return SDCustomFontsTokens.customFonts.font400Medium
    }
    
    static var font50SemiBold: Font {
        return SDCustomFontsTokens.customFonts.font50SemiBold
    }
    
    static var font75SemiBold: Font {
        return SDCustomFontsTokens.customFonts.font75SemiBold
    }
    
    static var font100SemiBold: Font {
        return SDCustomFontsTokens.customFonts.font100SemiBold
    }
    
    static var font200SemiBold: Font {
        return SDCustomFontsTokens.customFonts.font200SemiBold
    }
    
    static var font300SemiBold: Font {
        return SDCustomFontsTokens.customFonts.font300SemiBold
    }
    
    static var font400SemiBold: Font {
        return SDCustomFontsTokens.customFonts.font400SemiBold
    }
    
    static var font50Bold: Font {
        return SDCustomFontsTokens.customFonts.font50Bold
    }
    
    static var font75Bold: Font {
        return SDCustomFontsTokens.customFonts.font75Bold
    }
    
    static var font100Bold: Font {
        return SDCustomFontsTokens.customFonts.font100Bold
    }
    
    static var font200Bold: Font {
        return SDCustomFontsTokens.customFonts.font200Bold
    }
    
    static var font300Bold: Font {
        return SDCustomFontsTokens.customFonts.font300Bold
    }
    
    static var font400Bold: Font {
        return SDCustomFontsTokens.customFonts.font400Bold
    }
}
