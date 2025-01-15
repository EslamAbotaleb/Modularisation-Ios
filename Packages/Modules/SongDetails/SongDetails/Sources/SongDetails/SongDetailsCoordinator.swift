//
//  SongDetailsCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//
import AnalyticsInterface
import DependencyContainer
import SwiftUI
import CommonModels
import ArtistDetailInterface

final class SongDetailsCoordinator {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    @MainActor
    func makeViewController(with song: Song) async -> UIViewController {
        let analyticsTracker = await DCSafe.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let view = SongDetailsView(
            viewModel: .init(
                song: song,
                analyticsTracker: analyticsTracker,
                onGoToArtistTapped: pushArtistDetail(withIdentifier:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        hostingVC.title = song.name
        return hostingVC
    }
    @MainActor
    private func pushArtistDetail(withIdentifier id: String)  {
        Task {
            let gateway = await DCSafe.shared.resolve(type: .closureBased, for: ArtistDetailInterface.self)
            let view = await gateway.makeArtistDetailModule(
                navigationController: navigationController,
                artistIdentifier: id)
            navigationController?.pushViewController(view, animated: true)
        }
    }
}
