import UIKit
import JGProgressHUD

class OverlayManager {
    
    private static let shared = OverlayManager()
    private var rootViewController: UIViewController!
    private var hud: JGProgressHUD?
    
    private init() {}
    
    static func setRootViewController(_ viewController: UIViewController) {
        let overlayManager = OverlayManager.shared
        overlayManager.rootViewController = viewController
    }
    
    static func present(with message: String) {
        let overlayManager = OverlayManager.shared
        guard overlayManager.hud == nil else { return }
        DispatchQueue.main.async {
            let progressHud = JGProgressHUD(style: .dark)
            progressHud.textLabel.text = message
            progressHud.show(in: overlayManager.rootViewController.view)
            overlayManager.hud = progressHud
        }
    }
    
    static func hide() {
        let overlayManager = OverlayManager.shared
        guard let progressHud = overlayManager.hud else { return }
        DispatchQueue.main.async {
            progressHud.dismiss()
            overlayManager.hud = nil
        }
    }
    
}
