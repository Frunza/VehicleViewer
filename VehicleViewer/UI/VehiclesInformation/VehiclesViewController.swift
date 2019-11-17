import UIKit

class VehiclesViewController: UITableViewController {
    
    private let reuseIdentifier = "CarCell"
    private let carCellNibName = "CarCell"
    private let baseTitle = "Cars"
    
    var cars = [Car]()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with cars: [Car]) {
        super.init(nibName: nil, bundle: nil)
        self.cars = cars
        self.updateTitle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: String.empty(), style: .plain, target: nil, action: nil)
        self.tableView.register(UINib(nibName: carCellNibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = .darkerGrayColor
    }
    
    func update(cars: [Car]) {
        DispatchQueue.main.async {
            self.cars = cars
            self.updateTitle()
            self.tableView.reloadData()
        }
    }
    
    private func updateTitle() {
        let titlePrefix = cars.count == 0 ? String.empty() : " (\(cars.count))"
        self.navigationItem.title = self.baseTitle + titlePrefix
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CarCell
        let car = cars[indexPath.row]
        let cellModel = CarCellModel(imageUrl: car.carImageUrl, name: car.name, licensePlate: car.licensePlate)
        cell.updateModel(cellModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CarCell.dynamicHeight(for: tableView.frame.width)
    }
    
}
