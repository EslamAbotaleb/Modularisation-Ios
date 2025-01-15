//
//  AppDependencyConfigurar.swift
//  ModularisationStarter
//
//  Created by Eslam on 13/01/2025.
//
import ArtistDetail
import ArtistDetailInterface
import Foundation
import AnalyticsInterface
import Analytics
import DependencyContainer
import SongDetailsInterface
import SongDetails

enum AppDependencyConfigurar {
/*

 Passing argument of non-sendable type 'DependencyContainerRegistrationType' into actor-isolated context may introduce data races; this is an error in the Swift 6 language mode
 */
    // This func for registering all our dependencies, in the our project
     static func configure() {
        Task {
            let analyticsTracker = AnalyticsEventTracker()
            await DCSafe.shared.register(type: .singleInstance(analyticsTracker), for: AnalyticsEventTracking.self)
            let artistDetailClosure: @Sendable () -> ArtistDetailInterface = {
                ArtistDetailGateway()
            }
            await DCSafe.shared.register(type: .closureBased(artistDetailClosure), for: ArtistDetailInterface.self)

            let songDetailsClosure: @Sendable () -> SongDetailsInterface = {
                SongDetailsGateway()
            }
            await DCSafe.shared.register(type: .closureBased(songDetailsClosure), for: SongDetailsInterface.self)
        }
    }
}

