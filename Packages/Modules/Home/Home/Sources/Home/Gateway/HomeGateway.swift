//
//  HomeGateway.swift
//  Home
//
//  Created by Eslam on 14/01/2025.
//

import UIKit

public struct HomeGateway: Sendable {

    public init() {}

    @MainActor
    public func makeHomeModule() async -> UIViewController {
        let coordinator = HomeCoordinator()
        return await coordinator.makeViewController()
    }
}
