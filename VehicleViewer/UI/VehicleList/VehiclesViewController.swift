import UIKit
import VehicleViewerCore

class VehiclesViewController: UITableViewController {
    
    private let reuseIdentifier = "CarCell"
    private let carCellNibName = "CarCell"
    private let baseTitle = "Cars"
    
    var carsViewModels = [CarViewModel]()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with cars: [Car]) {
        super.init(nibName: nil, bundle: nil)
        self.carsViewModels = cars.map { CarViewModel(car: $0) }
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
            self.carsViewModels = cars.map { CarViewModel(car: $0) }
            self.updateTitle()
            self.tableView.reloadData()
        }
    }
    
    private func updateTitle() {
        let titlePrefix = carsViewModels.count == 0 ? String.empty() : " (\(carsViewModels.count))"
        self.navigationItem.title = self.baseTitle + titlePrefix
    }
    
}

// Table view data source
extension VehiclesViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CarCell
        let carViewModel = carsViewModels[indexPath.row]
        cell.carViewModel = carViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CarCell.dynamicHeight(for: tableView.frame.width)
    }
    
}
