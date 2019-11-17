import UIKit
import VehicleViewerCore
import VehicleViewerMapView

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var vehiclesViewController: VehiclesViewController?
    var vehicleMapViewController: VehicleMapViewController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .white
        UINavigationBar.appearance().tintColor = .white
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let tabBarController = UITabBarController()
        OverlayManager.setRootViewController(tabBarController)
        configure(tabBarController)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func configure(_ tabBarController: UITabBarController) {
        #if DEBUG
        let localDataProvider = LocalDataProvider(carsFile: AppConstants.carsFileName, type: AppConstants.resourceType, mockDelay: AppConstants.mockDelay)
        let carsProvider = CarsProvider.build(localDataProvider)
        #else
        let carsProvider = CarsProvider.build(OnlineCarsNetworkManager())
        #endif
        
        let firstTabNavigationController = buildFirstTabBarViewController()
        let secondTabNavigationControoller = buildSecondTabBarViewController()
        tabBarController.viewControllers = [firstTabNavigationController, secondTabNavigationControoller]
        
        OverlayManager.present(with: UIConstants.loadingCarsText)
        carsProvider.loadCars(onSuccess: { cars in
            self.vehiclesViewController?.update(cars: cars)
            self.vehicleMapViewController?.update(cars: cars)
            OverlayManager.hide()
        }) { OverlayManager.hide() }
        
        let item1 = UITabBarItem(title: String.empty(), image: SFSymbols.car, tag: 0)
        let item2 = UITabBarItem(title: String.empty(), image:  SFSymbols.map, tag: 1)
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
    }
    
    private func buildFirstTabBarViewController() -> UIViewController {
        let vehiclesViewController = VehiclesViewController(with: [])
        let navigationControoller = UINavigationController.init(rootViewController: vehiclesViewController)
        self.vehiclesViewController = vehiclesViewController
        navigationControoller.navigationBar.barStyle = .black
        return navigationControoller
    }
    
    private func buildSecondTabBarViewController() -> UIViewController {
        let vehicleMapViewController = VehicleMapViewController(cars: [])
        let navigationControoller = UINavigationController.init(rootViewController: vehicleMapViewController)
        self.vehicleMapViewController = vehicleMapViewController
        navigationControoller.navigationBar.barStyle = .black
        return navigationControoller
    }

}

