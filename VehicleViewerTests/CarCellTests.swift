import XCTest
@testable import VehicleViewer

final class CarCellTests: XCTestCase {
    
    func test_dynamicHeight_should_correctlyCalculateTheDynamicHeight() {
        let dynamicHeightValue = CarCell.dynamicHeight(for: 120)
        XCTAssertEqual(dynamicHeightValue, 67)
    }

    static var allTests = [
        ("test_dynamicHeight_should_correctlyCalculateTheDynamicHeight", test_dynamicHeight_should_correctlyCalculateTheDynamicHeight)
    ]
}
