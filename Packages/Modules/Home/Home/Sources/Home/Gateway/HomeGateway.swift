//
//  HomeGateway.swift
//  Home
//
//  Created by Eslam on 14/01/2025.
//

import UIKit
//MARK: - This Gateway not implement protocol because of this is first initial module don't contain previous dependency
@MainActor
public struct HomeGateway: Sendable {

    public init() {}

    public func makeHomeModule() -> UIViewController {
        //MARK: - Creation for coordinator
        let coordinator = HomeCoordinator()
        //MARK: - display the home view
        return  coordinator.makeViewController()
    }
}
