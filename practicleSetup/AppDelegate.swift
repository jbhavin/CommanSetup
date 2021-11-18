//
//  AppDelegate.swift
//  practicleSetup
//
//  Created by bhavin joshi on 31/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
//    func sidemenusetup(fromAdmin : Bool)
//    {
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let rootViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
//        rootViewController?.fromAdmin = fromAdmin
//        let leftViewController = storyboard.instantiateViewController(withIdentifier: "SidemenuVC") as? SidemenuVC
//        leftViewController?.fromAdmin = fromAdmin
//        let navigationController = UINavigationController(rootViewController: rootViewController!)
//        navigationController.isNavigationBarHidden = false // or not, your choice.
//        let sideMenuController = LGSideMenuController(rootViewController: navigationController,
//                                                      leftViewController: leftViewController,
//                                                      rightViewController: nil)
//        if UIDevice.current.userInterfaceIdiom == .pad{
//            sideMenuController.leftViewWidth = 450
//        }
//        else{
//            sideMenuController.leftViewWidth = 300
//        }
//        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "OpenSans-Regular", size: 15)!]
//        sideMenuController.leftViewPresentationStyle = .slideAbove
//        UIApplication.shared.windows.first?.rootViewController = sideMenuController
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

