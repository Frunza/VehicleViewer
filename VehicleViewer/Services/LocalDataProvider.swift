import Foundation

struct LocalDataProvider: CarsDataProviderProtocol {
    
    private let testCarsFile: String
    private let resourceType: String
    private let mockDelay: UInt32
    
    init(carsFile: String, type: String, mockDelay: UInt32 = 0) {
        self.testCarsFile = carsFile
        self.resourceType = type
        self.mockDelay = mockDelay
    }
    
    func loadCars(onSuccess: @escaping (([RestCar]) -> ()), onFailure: (() -> ())?) {
        DispatchQueue.global(qos: .background).async {
            sleep(self.mockDelay)
            guard let content = self.readContentFrom(fileNamed: self.testCarsFile, onFailure: onFailure) else { return }
            guard let cars = try? JSONDecoder().decode([RestCar].self, from: content) else {
                Logger.log("Failed to parse json data from \(self.testCarsFile)")
                onFailure?()
                return
            }
            onSuccess(cars)
        }
    }
    
    private func readContentFrom(fileNamed: String, onFailure: (() -> ())?) -> Data? {
        guard let filePath = Bundle.main.path(forResource: fileNamed, ofType: resourceType) else {
            Logger.log("Failed to build file path for \(fileNamed)")
            onFailure?()
            return nil
        }
        guard let content = try? String(contentsOfFile: filePath).data(using: .utf8) else {
            Logger.log("Failed to read json data from \(filePath)")
            onFailure?()
            return nil
        }
        return content
    }
    
}
