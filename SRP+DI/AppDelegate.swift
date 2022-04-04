//
//  AppDelegate.swift
//  SRP
//
//  Created by Jeytery on 04.04.2022.
//

import UIKit

func SRPModule() -> SRPViewController {
    let view = SRPViewController()
    
    // dependency injection, here in presenter
    let presenter = SRPPresenter(viewInput: view)
    
    view.output = presenter
    return view
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let viewController = SRPModule()
        let nvc = UINavigationController(rootViewController: viewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
        return true
    }
}

