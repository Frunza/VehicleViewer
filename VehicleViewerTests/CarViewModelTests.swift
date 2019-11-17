import XCTest
@testable import VehicleViewer
@testable import VehicleViewerCore

final class CarViewModelTests: XCTestCase {
    
    func test_carViewModelConstructor_should_correctlyBuildTheStructAmdFixBrokenValues() {
        let car = Car(id: "testId", name: "testName", make: "testMake", color: "test_color", series: "testSeries", fuelType: "testFuelType", fuelLevel: 111, transmission: "testTransmision", licensePlate: "?test?License?Plate?", latitude: 123, longitude: 456, innerCleanliness: "testInnerCleanliness", imageUrl: "testImageUrl")
        
        // nothing should change
        XCTAssertEqual(car.color, "test_color")
        XCTAssertEqual(car.licensePlate, "?test?License?Plate?")
        
        let carViewModel = CarViewModel(car: car)
        
        XCTAssertEqual(carViewModel.id, "testId")
        XCTAssertEqual(carViewModel.name, "testName")
        XCTAssertEqual(carViewModel.make, "testMake")
        // the color should be fixed by CarViewModel
        XCTAssertEqual(carViewModel.color, "test color")
        XCTAssertEqual(carViewModel.series, "testSeries")
        XCTAssertEqual(carViewModel.fuelType, "testFuelType")
        XCTAssertEqual(carViewModel.fuelLevel, 111)
        XCTAssertEqual(carViewModel.transmission, "testTransmision")
        // the license plate should be fixed by CarViewModel
        XCTAssertEqual(carViewModel.licensePlate, "testLicensePlate")
        XCTAssertEqual(carViewModel.latitude, 123)
        XCTAssertEqual(carViewModel.longitude, 456)
        XCTAssertEqual(carViewModel.innerCleanliness, "testInnerCleanliness")
        XCTAssertEqual(carViewModel.imageUrl, "testImageUrl")
    }

    static var allTests = [
        ("test_carViewModelConstructor_should_correctlyBuildTheStructAmdFixBrokenValues", test_carViewModelConstructor_should_correctlyBuildTheStructAmdFixBrokenValues)
    ]
}
