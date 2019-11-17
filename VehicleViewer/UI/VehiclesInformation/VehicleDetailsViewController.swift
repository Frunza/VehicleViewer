import UIKit

class VehicleDetailsViewController: UIViewController {
    
    var model: Car!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initialize(with car: Car) {
        self.model = car
        self.navigationItem.title = car.name
         self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .white
    }

}
