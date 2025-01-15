//
//  HomeServiceTestMock.swift
//  ModularisationStarterTests
//
//  Created by Emre Havan on 14.02.24.
//

import Foundation
import CommonModels
import XCTest
@testable import Home

final class HomeServiceTestMock: HomeServing, @unchecked Sendable {

    var fetchSongsExpectation: XCTestExpectation?

    func fetchSongs() async -> [Song] {
        fetchSongsExpectation?.fulfill()
        return [.init(id: "1", name: "test", artistName: "test", artistIdentifier: "1", lyrics: "test")]
    }
}
