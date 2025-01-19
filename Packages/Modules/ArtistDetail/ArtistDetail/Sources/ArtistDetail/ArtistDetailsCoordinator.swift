//
//  ArtistDetailsCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import AnalyticsInterface
import DependencyContainer
import SwiftUI
import CommonModels
import SongDetailsInterface

@MainActor
final class ArtistDetailsCoordinator {

    private weak var navigationController: UINavigationController?

     init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func makeViewController(artistIdentifier: String) async -> UIViewController {
        let analyticsTracker =  await DCSafe.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let view = ArtistDetailsView(
            viewModel: .init(
                artistService: ArtistService(),
                analyticsTracker: analyticsTracker,
                artistIdentifier: artistIdentifier,
                onSongSelected: pushSongDetail(_:)
            )
        )
         let hostingVC = UIHostingController(rootView: view)
        return hostingVC
    }


    func pushSongDetail(_ song: Song)  {
        Task {
            let gateway =  await DCSafe.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
            let songDetailView =  await gateway.makeSongDetailsModule(navigationController: navigationController, song: song)
            navigationController?.pushViewController(songDetailView, animated: true)
        }
    }
}
