//
//  RootCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import UIKit
import Home

@MainActor
final class RootCoordinator: Sendable {
    func makeInitialView()  -> UIViewController {
        let gateway = HomeGateway()
        let homeView =  gateway.makeHomeModule()
        let tabBarController =  RootTabBarController(viewControllers: [homeView])
        return tabBarController
    }
}

