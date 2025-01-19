//
//  HomeGateway.swift
//  Home
//
//  Created by Eslam on 14/01/2025.
//

import UIKit

public struct HomeGateway: Sendable {

    public init() {}

    public func makeHomeModule() async -> UIViewController {
        let coordinator = HomeCoordinator()
        //MARK: - display the home view
        return await coordinator.makeViewController()
    }
}
