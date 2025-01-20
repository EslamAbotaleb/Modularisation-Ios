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
            /// register as single instance because of this shared resource dependency will be in lifetime project don't need to create a new one instance every time
            await DCSafe.shared.register(type: .singleInstance(analyticsTracker), for: AnalyticsEventTracking.self)

            //Song
            let songDetailsClosure: @Sendable () -> SongDetailsInterface = {
                SongDetailsGateway()
            }
            /// Closure based here will create every time new instance from dependency
            /// Cause be maybe this view type  need to be configured differently or whatever the change will happen that's way register as closure based not single instance
            await DCSafe.shared.register(type: .closureBased(songDetailsClosure), for: SongDetailsInterface.self)

            //Artist
            let artistDetailClosure: @Sendable () -> ArtistDetailInterface = {
                ArtistDetailGateway()
            }
            /// Closure based here will create every time new instance from dependency
            await DCSafe.shared.register(type: .closureBased(artistDetailClosure), for: ArtistDetailInterface.self)
        }
    }
}

