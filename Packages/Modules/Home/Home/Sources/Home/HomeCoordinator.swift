//
//  HomeCoordinator.swift
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
 final class HomeCoordinator {

    //MARK: - initial for navigation controller
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()

    //MARK: - make vc
    func makeViewController() async -> UIViewController {
        let analyticsTracker = await DCSafe.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let viewModel = HomeViewModel(homeService: HomeService(), analyticsTracker: analyticsTracker, onSongSelected: pushSongDetail(_:))
        let homeView = HomeView(viewModel: viewModel)
        let hostingVC =  UIHostingController(rootView: homeView)
         navigationController.setViewControllers([hostingVC], animated: false)
        return navigationController
    }

    //MARK: - push
    func pushSongDetail(_ song: Song)  {
        Task {
            let gateway = await DCSafe.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
//            let coordinator = SongDetailsCoordinator(navigationController: navigationController)
            let songDetailView =  await gateway.makeSongDetailsModule(navigationController: navigationController, song: song)
            navigationController.pushViewController(songDetailView, animated: true)
        }
    }
}
