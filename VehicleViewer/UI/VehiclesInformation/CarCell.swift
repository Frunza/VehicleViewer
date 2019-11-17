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
    
    private static let imageRatio: CGFloat = 0.57
    private static let imageMargin: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .darkerGrayColor
    }
    
    func updateModel(_ model: CarCellModel) {
        nameLabel.text = model.name
        licensePlateLabel.text = model.licensePlate
        vehicleImageView.sd_setImage(with: URL(string: model.imageUrl), placeholderImage: Images.defaultCar)
    }
    
    static func dynamicHeight(for width: CGFloat) -> CGFloat {
        let imageWidth = width - 2 * imageMargin
        let imageHeight = imageWidth * imageRatio
        return imageHeight + imageMargin
    }
    
}
