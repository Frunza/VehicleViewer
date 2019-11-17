import XCTest
@testable import VehicleViewer

final class AppConstantsTests: XCTestCase {
    
    func test_sppConstants_should_provideExpectedConstants() {
        _ = AppConstants.carsFileName
        _ = AppConstants.mockDelay
        _ = AppConstants.resourceType
    }

    static var allTests = [
        ("test_sppConstants_should_provideExpectedConstants", test_sppConstants_should_provideExpectedConstants)
    ]
}
