import Foundation

public struct Logger {
    public static func success(
        _ message: @autoclosure () -> String,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\n")
        print("✅ **************** SUCCESS(STARTED) ************** ✅")
        print("✅ [\(fileName):\(line)] \(function) - \(message()) ✅")
        print("✅ **************** SUCCESS(ENDED) **************** ✅")
        print("\n")
#endif
    }
    
    public static func failure(
        _ message: @autoclosure () -> String,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\n")
        print("❌ **************** FAILURE(STARTED) ************** ❌")
        print("❌ [\(fileName):\(line)] \(function) - \(message()) ❌")
        print("❌ **************** FAILURE(ENDED) **************** ❌")
        print("\n")
#endif
    }
}
