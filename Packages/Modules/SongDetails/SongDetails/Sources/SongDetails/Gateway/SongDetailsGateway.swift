//
//  SongDetailsGateway.swift
//  SongDetails
//
//  Created by Eslam on 14/01/2025.
//

import UIKit
import SongDetailsInterface
import CommonModels

public struct SongDetailsGateway: SongDetailsInterface {
    public init() {
    }
    @MainActor
    public func makeSongDetailsModule(navigationController: UINavigationController?, song: Song) async -> UIViewController {
        let coordinator = SongDetailsCoordinator(navigationController: navigationController)
        return await coordinator.makeViewController(with: song)
    }
}
