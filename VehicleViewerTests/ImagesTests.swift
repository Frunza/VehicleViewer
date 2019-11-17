import XCTest
@testable import VehicleViewer

final class ImagesTests: XCTestCase {
    
    func test_images_should_successfullyLoadDefinedImages() {
        _ = Images.defaultCar
    }

    static var allTests = [
        ("test_images_should_successfullyLoadDefinedImages", test_images_should_successfullyLoadDefinedImages)
    ]
}
