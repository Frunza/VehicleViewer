import UIKit
import SDWebImage

struct CarCellModel {
    let imageUrl: String
    let name: String
    let licensePlate: String
}

class CarCell: UITableViewCell {

    @IBOutlet private weak var vehicleImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var licensePlateLabel: UILabel!
    
    private let imageRatio: CGFloat = 0.57
    
    func updateModel(_ model: CarCellModel) {
        nameLabel.text = model.name
        licensePlateLabel.text = model.licensePlate
        vehicleImageView.sd_setImage(with: URL(string: model.imageUrl), placeholderImage: Images.defaultCar)
        let imageWidth = vehicleImageView.frame.size.width
        let imageHeight = Int(imageWidth * imageRatio)
        let imageHeightCGFloat = CGFloat(imageHeight)
        vehicleImageView.heightAnchor.constraint(equalToConstant: CGFloat(imageHeight)).isActive = true
    }
    
}
