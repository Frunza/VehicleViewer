import MapKit

class CustomAnnotationView : MKAnnotationView {

    override var annotation: MKAnnotation? {
    willSet {
        guard let annotation = newValue else { return }
        self.canShowCallout = true
        self.image = SFSymbols.car
        self.centerOffset = CGPoint(x: 0, y: -self.image!.size.height / 2)
        self.annotation = annotation
        }
    }
        
}
