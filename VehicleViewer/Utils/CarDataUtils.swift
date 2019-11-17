import Foundation

struct CarDataUtils {
    
    static func heal(licensePlate: String) -> String {
        return licensePlate.replacingOccurrences(of: "?", with: "")
    }
    
    static func heal(color: String) -> String {
        return color.replacingOccurrences(of: "_", with: " ")
    }
    
}
