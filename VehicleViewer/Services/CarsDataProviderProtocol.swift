import Foundation

protocol CarsDataProviderProtocol {
    
    func loadCars(onSuccess: @escaping (([RestCar]) -> ()), onFailure: (() -> ())?)
    
}
