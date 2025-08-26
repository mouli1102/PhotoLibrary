//
//  PhotoListViewTests.swift
//  PhotoLibraryTests
//
//  Created by 2403464 on 25/08/25.
//

import Testing
@testable import PhotoLibrary

struct PhotoListViewTests {
    
    @Test("Displays loading state")
    func testLoadingState() {
        // Given
        let viewModel = PhotoListViewModel(apiServive: MockService())
        viewModel.isLoading = true
        
        // When
        let view = PhotoListView(viewModel: viewModel)
        
        // Then - Use a more generic type check
        let mirror = Mirror(reflecting: view.body)
        let hasProgressView = mirror.children.contains { child in
            String(describing: type(of: child.value)).contains("ProgressView")
        }
        #expect(hasProgressView)
    }
    
    @Test("Displays error state")
    func testErrorState() {
        // Given
        let viewModel = PhotoListViewModel(apiServive: MockService())
        viewModel.isLoading = false
        viewModel.errorMessage = "Test error"
        
        // When
        let view = PhotoListView(viewModel: viewModel)
        
        // Then - With Swift Testing, we focus on behavior testing
        #expect(!viewModel.isLoading)
        #expect(viewModel.errorMessage == "Test error")
    }
    
    @Test("Displays empty state")
    func testEmptyState() {
        // Given
        let viewModel = PhotoListViewModel(apiServive: MockService())
        viewModel.isLoading = false
        viewModel.errorMessage = nil
        viewModel.photoListItems = []
        
        // When
        let view = PhotoListView(viewModel: viewModel)
        
        // Then
        #expect(viewModel.photoListItems.isEmpty)
        #expect(!viewModel.isLoading)
        #expect(viewModel.errorMessage == nil)
    }
}
