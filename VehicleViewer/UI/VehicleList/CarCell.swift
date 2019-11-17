import UIKit
import SDWebImage
import VehicleViewerCore

struct CarCellModel {
    let imageUrl: String
    let name: String
    let licensePlate: String
}

class CarCell: UITableViewCell {

    @IBOutlet private weak var vehicleImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var licensePlateLabel: UILabel!
    
    private static let imageRatio: CGFloat = 0.57
    private static let imageMargin: CGFloat = 10
    
    var carViewModel: CarViewModel! {
        didSet {
            nameLabel.text = carViewModel.name
            licensePlateLabel.text = carViewModel.licensePlate
            vehicleImageView.sd_setImage(with: URL(string: carViewModel.imageUrl), placeholderImage: Images.defaultCar)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .darkerGrayColor
    }
    
    static func dynamicHeight(for width: CGFloat) -> CGFloat {
        let imageWidth = width - 2 * imageMargin
        let imageHeight = imageWidth * imageRatio
        return imageHeight + imageMargin
    }
    
}
