VehicleViewer
---------------
App that views vehicles in a list and on a map.

Requirements
------------

- Xcode 11.2
- Deployment target of iOS 13.2 or higher
- Deployment device is iPhone

How to run
--------------

Open the project in Xcode and run it in the simulator.
Xcode 11 should resolve all package dependencies when you open the project for the first time. Should this fail, do it manually ( File -> Swift Packages -> Resolve Package Versions ).

Running the app in debug will use mock data retrieved from the main bundle.
In order to use the REST API run the app in release (edit the "VehicleViewer" scheme and change the "Build Configuration" to "Release")

Swift packages
--------------

VehicleViewerCore:
The core components for the application.

VehicleViewerMapView:
The component that contains the map view. It is dependent on VehicleViewerCore.

JGProgressHUD:
Elegant progress HUD for the application. It is used to display a progress hud during asynchronous loading of resources.

SDWebImage:
Used to asynchronous load images from an URL and display them in an ImageView. It was chosen because of elegance and caching features.
