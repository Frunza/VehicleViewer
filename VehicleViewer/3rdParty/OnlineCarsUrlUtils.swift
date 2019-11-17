import Foundation

struct EShopUrlUtils {
    
    // Resource URL constants
    private static let baseUrl = "https://cdn.sixt.io/codingtask"
    private static let carsResource = "/cars"
 
    static func createCarsUrl() -> String {
        return "\(EShopUrlUtils.baseUrl)\(EShopUrlUtils.carsResource)"
    }
    
}
