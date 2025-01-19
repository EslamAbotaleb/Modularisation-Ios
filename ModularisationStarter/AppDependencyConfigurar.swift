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
    // This func for registering all our dependencies, in the our project
     static func configure() {
        Task {
            let analyticsTracker = AnalyticsEventTracker()
            await DCSafe.shared.register(type: .singleInstance(analyticsTracker), for: AnalyticsEventTracking.self)

            //Artist
            let artistDetailClosure: @Sendable () -> ArtistDetailInterface = {
                ArtistDetailGateway()
            }
            await DCSafe.shared.register(type: .closureBased(artistDetailClosure), for: ArtistDetailInterface.self)

            //Song
            let songDetailsClosure: @Sendable () -> SongDetailsInterface = {
                SongDetailsGateway()
            }
            await DCSafe.shared.register(type: .closureBased(songDetailsClosure), for: SongDetailsInterface.self)
        }
    }
}

