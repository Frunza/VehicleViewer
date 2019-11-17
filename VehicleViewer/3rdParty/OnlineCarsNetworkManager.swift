import Foundation

struct EShopNetworkManager: CarsDataProviderProtocol {

    typealias ResponseParameters = (data: Data?, response: URLResponse?, error: Error?)
    
    func loadCars(onSuccess: @escaping (([RestCar]) -> ()), onFailure: (() -> ())?) {
        let urlString = EShopUrlUtils.createCarsUrl()
        guard let url = URL(string: urlString) else {
            Logger.log("Failed to build the cars URL")
            onFailure?()
            return
        }
        let request = createGetRequest(with: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = self.extractData(from: ResponseParameters(data, response, error), dataTypeName: "categories", expectedStatus: 200) else {
                onFailure?()
                return
            }
            do {
               let cars = try JSONDecoder().decode([RestCar].self, from: data)
               onSuccess(cars)
            } catch let error {
                Logger.log("Loading categories failed with JSON conversion error: \(error.localizedDescription)")
                onFailure?()
            }
        }.resume()
    }
    
    private func createGetRequest(with url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func extractData(from responseParameters: ResponseParameters, dataTypeName: String, expectedStatus: Int) -> Data? {
        if let error = responseParameters.error {
            Logger.log("Loading \(dataTypeName) failed with error: \(error.localizedDescription)")
            return nil
        }
        guard let response = responseParameters.response as? HTTPURLResponse, response.statusCode == expectedStatus else {
            Logger.log("Loading \(dataTypeName) returned an invalid sttus code")
            return nil
        }
        guard let data = responseParameters.data else {
            Logger.log("Loading \(dataTypeName) did not return any data")
            return nil
        }
        return data
    }
    
}
