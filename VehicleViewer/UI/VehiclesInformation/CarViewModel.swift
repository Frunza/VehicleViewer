import Foundation
import VehicleViewerCore

struct CarViewModel {
    
    let id: String
    let name: String
    let make: String
    let color: String
    let series: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: String
    let imageUrl: String
    
    init(car: Car) {
        self.id = car.id
        self.name = car.name
        self.make = car.make
        self.color = CarDataUtils.heal(color: car.color)
        self.series = car.series
        self.fuelType = car.fuelType
        self.fuelLevel = car.fuelLevel
        self.transmission = car.transmission
        self.licensePlate = CarDataUtils.heal(licensePlate: car.licensePlate)
        self.latitude = car.latitude
        self.longitude = car.longitude
        self.innerCleanliness = car.innerCleanliness
        self.imageUrl = car.imageUrl
    }
    
}
