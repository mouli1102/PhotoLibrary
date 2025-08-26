//
//  PhotoListView.swift
//  PhotoLibrary
//
//  Created by 2403464 on 25/08/25.
//
import SwiftUI
import Foundation

/// A SwiftUI view that displays a list of photos with different states for loading, errors, and empty results.
struct PhotoListView: View {
    @StateObject var viewModel = PhotoListViewModel()
    init(viewModel: PhotoListViewModel = PhotoListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView("Loading.")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text("Error:\(errorMessage)")
                            .foregroundColor(.red)
                            .padding()
                        Button("Try Again") {
                            Task {
                                await viewModel.fetchPhotoListItems()
                            }
                        }
                    }
                } else if viewModel.photoListItems.isEmpty {
                    Text("No items")
                        .foregroundColor(.gray)
                } else {
                    List(viewModel.photoListItems) { photoListItem in
                        PhotoListRow(photoListItem: photoListItem)
                    }
                }
            }
            .navigationTitle("Photo List")
        }
        .onAppear {
            Task {
                await viewModel.fetchPhotoListItems()
            }
        }
    }
}
