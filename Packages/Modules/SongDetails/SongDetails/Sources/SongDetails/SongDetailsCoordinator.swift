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

@MainActor class SongDetailsCoordinatorActor {}

final class SongDetailsCoordinator: SongDetailsCoordinatorActor, Sendable {

    private weak var navigationController: UINavigationController?

    //MARK: - init navigation controller
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    //MARK: - make type vc
    func makeViewController(with song: Song) async -> UIViewController {
        let analyticsTracker = await DCSafe.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let viewModel = SongDetailsViewModel(song: song, analyticsTracker: analyticsTracker, onGoToArtistTapped: pushArtistDetail(withIdentifier:))
        let view = SongDetailsView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: view)
        hostingVC.title = song.name
        return hostingVC
    }

    //MARK: - push
    private func pushArtistDetail(withIdentifier id: String)  {
        Task {
            let gateway = await DCSafe.shared.resolve(type: .closureBased, for: ArtistDetailInterface.self)
            let artistView = await gateway.makeArtistDetailModule(
                navigationController: navigationController,
                artistIdentifier: id)
            navigationController?.pushViewController(artistView, animated: true)
        }
    }
}
