import Foundation

struct RestCar: Codable {
    
    public let id: String
    public let modelIdentifier: String
    public let modelName: String
    public let name: String
    public let make: String
    public let group: String
    public let color: String
    public let series: String
    public let fuelType: String
    public let fuelLevel: Double
    public let transmission: String
    public let licensePlate: String
    public let latitude: Double
    public let longitude: Double
    public let innerCleanliness: String
    public let carImageUrl: String
    
    public func asCar() -> Car {
        return Car(id: id, name: name, make: make, color: color, series: series, fuelType: fuelType, fuelLevel: fuelLevel, transmission: transmission, licensePlate: licensePlate, latitude: latitude, longitude: longitude, innerCleanliness: innerCleanliness, imageUrl: carImageUrl)
    }
    
}
