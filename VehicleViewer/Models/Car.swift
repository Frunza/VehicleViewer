import Foundation

struct Car {
    
    public let id: String
    public let name: String
    public let make: String
    public let color: String
    public let series: String
    public let fuelType: String
    public let fuelLevel: Double
    public let transmission: String
    public let licensePlate: String
    public let latitude: Double
    public let longitude: Double
    public let innerCleanliness: String
    public let imageUrl: String
    
    init(id: String, name: String, make: String, color: String, series: String, fuelType: String, fuelLevel: Double, transmission: String, licensePlate: String, latitude: Double, longitude: Double, innerCleanliness: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.make = make
        self.color = color
        self.series = series
        self.fuelType = fuelType
        self.fuelLevel = fuelLevel
        self.transmission = transmission
        self.licensePlate = licensePlate
        self.latitude = latitude
        self.longitude = longitude
        self.innerCleanliness = innerCleanliness
        self.imageUrl = imageUrl
    }
    
}
