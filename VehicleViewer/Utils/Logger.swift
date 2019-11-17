import Foundation

public struct Logger {
    
    public static func log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
    
}
