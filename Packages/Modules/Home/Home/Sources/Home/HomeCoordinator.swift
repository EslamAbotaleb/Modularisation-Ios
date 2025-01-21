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
final class HomeCoordinator: Sendable {

    //MARK: - Initial for navigation controller
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()

//    //MARK: - Make vc
    func makeViewController() -> UIViewController {
        // You can use a Task to wrap async code in a synchronous method
        Task {
            let analyticsTracker = await DCSafe.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
            let viewModel = HomeViewModel(homeService: HomeService(), analyticsTracker: analyticsTracker, onSongSelected: pushSongDetail(_:))
            let homeView = HomeView(viewModel: viewModel)
            let hostingVC = UIHostingController(rootView: homeView)
            navigationController.setViewControllers([hostingVC], animated: false)
        }

        // Return the navigationController synchronously
        return navigationController
    }
    //MARK: - Push
    func pushSongDetail(_ song: Song)  {
        Task {
            //MARK: - resolve first before to go into song details
            let gateway = await DCSafe.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
            let songDetailView =  await gateway.makeSongDetailsModule(navigationController: navigationController, song: song)
            navigationController.pushViewController(songDetailView, animated: true)
        }
    }
}
