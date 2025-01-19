//
//  HomeView.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import SwiftUI
import AnalyticsInterface
import Utilities
import Localisation

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            if viewModel.songs.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.songs) { song in
                        Text(song.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.didSelectSong(song)
                            }
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("ms_home_title".localisedCommon)
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    HomeView(viewModel: .init(homeService: HomeService(), analyticsTracker: AnalyticsEventTrackerMock(), onSongSelected: { _ in }))
}
