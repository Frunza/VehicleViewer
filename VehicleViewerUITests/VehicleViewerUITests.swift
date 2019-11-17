import XCTest

class VehicleViewerUITests: XCTestCase {
    
    private let mockSleepDelay: UInt32 = 3

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatThereShouldBe2TabItems() {
        let app = XCUIApplication()
        app.launch()
        sleep(mockSleepDelay)
        let tabBarsQuery = XCUIApplication().tabBars
        XCTAssertEqual(tabBarsQuery.buttons.count, 2)
    }

    func testThatThereAre28CarsInTheTableView() {
        let app = XCUIApplication()
        app.launch()
        sleep(mockSleepDelay)
        XCTAssertEqual(XCUIApplication().tables.cells.count, 28)
    }

    func testFirstCarFromTableView() {
        let app = XCUIApplication()
        app.launch()
        sleep(mockSleepDelay)
        
        let tablesQuery = XCUIApplication().tables
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        
        let firstCellNameLabel = firstCell.staticTexts["Vanessa"]
        XCTAssertNotNil(firstCellNameLabel.value)
        
        let firstCellLicensePlate = firstCell.staticTexts["M-VO0259"]
        XCTAssertNotNil(firstCellLicensePlate.value)
    }

    func testSecondCarFromTableView() {
        let app = XCUIApplication()
        app.launch()
        sleep(mockSleepDelay)
        
        let tablesQuery = XCUIApplication().tables
        let firstCell = tablesQuery.cells.element(boundBy: 1)
        
        let firstCellNameLabel = firstCell.staticTexts["Regine"]
        XCTAssertNotNil(firstCellNameLabel.value)
        
        let firstCellLicensePlate = firstCell.staticTexts["M-I7425"]
        XCTAssertNotNil(firstCellLicensePlate.value)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
