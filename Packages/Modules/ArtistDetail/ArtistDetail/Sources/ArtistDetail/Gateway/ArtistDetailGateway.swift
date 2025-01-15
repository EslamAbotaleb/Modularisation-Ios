//
//  ArtistDetailGateway.swift
//  ArtistDetail
//
//  Created by Eslam on 13/01/2025.
//

import UIKit
import ArtistDetailInterface

public struct ArtistDetailGateway: ArtistDetailInterface {

    public init() {}

    @MainActor
    public func makeArtistDetailModule(navigationController: UINavigationController?, artistIdentifier: String) async -> UIViewController {
        let coordinator = ArtistDetailsCoordinator(navigationController: navigationController)
        return await coordinator.makeViewController(artistIdentifier: artistIdentifier)
    }
}
