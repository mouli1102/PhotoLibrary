//
//  PhotoListViewModel.swift
//  PhotoLibrary
//
//  Created by 2403464 on 25/08/25.
//

import Foundation
import Combine

/// `PhotoListViewModel` is an observable object that handles fetching, storing, and managing
/// the state of photo data. It communicates with a data source through the `APIProtocol`
/// and publishes changes to its state so that SwiftUI views can react accordingly.
class PhotoListViewModel: ObservableObject {
    @Published var photoListItems: [PhotoEntity] = []
    @Published var errorMessage: String?
    @Published var isLoading = true
    
    let apiServive: APIProtocol
    
    init(apiServive: APIProtocol = APIService()) {
        self.apiServive = apiServive
    }
    
    @MainActor
    func fetchPhotoListItems() async {
        isLoading = true
        errorMessage = nil
        
        do {
            photoListItems = try await apiServive.fetchData()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
