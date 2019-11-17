import Foundation

protocol CarsProviderProtocol {
    
    func loadCars(onSuccess: @escaping (([Car]) -> ()), onFailure: (() -> ())?)
    func loadCars() -> [Car]
    
}

struct CarsProvider<DataProvider: CarsDataProviderProtocol>: CarsProviderProtocol {
        
    var dataProvider: CarsDataProviderProtocol

    init(dataProvider: CarsDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    static func build(_ dataProvider: DataProvider) -> CarsProvider<DataProvider> {
        return CarsProvider<DataProvider>(dataProvider: dataProvider)
    }
        
    func loadCars(onSuccess: @escaping (([Car]) -> ()), onFailure: (() -> ())?) {
        dataProvider.loadCars(onSuccess: { restCars in
            let cars = restCars.map { $0.asCar() }
            onSuccess(cars)
        }) { onFailure?() }
    }
    
    func loadCars() -> [Car] {
        var cars = [Car]()
        let semaphore = DispatchSemaphore(value: 0)
        dataProvider.loadCars(onSuccess: { restCars in
            cars = restCars.map { $0.asCar() }
            semaphore.signal()
        }, onFailure: nil)
        semaphore.wait()
        return cars
    }
    
}
