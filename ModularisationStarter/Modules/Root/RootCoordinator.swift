//
//  RootCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import UIKit
import Home

final class RootCoordinator {
    func makeInitialView() async -> UIViewController {
        let gateway = HomeGateway()
        let homeView = await gateway.makeHomeModule()
        let tabBarController = await RootTabBarController(viewControllers: [homeView])
        return tabBarController
    }
}

