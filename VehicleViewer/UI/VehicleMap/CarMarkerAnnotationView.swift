import MapKit

class CarMarkerAnnotationView: MKMarkerAnnotationView {

    static let reuseID = "carMarkerAnnotation"

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "cars"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForDisplay() {
        super.prepareForDisplay()
        markerTintColor = UIColor.lightBlue
        glyphImage = SFSymbols.car
    }
    
}
