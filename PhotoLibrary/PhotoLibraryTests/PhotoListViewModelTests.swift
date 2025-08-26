//
//  PhotoListViewModelTests.swift
//  PhotoLibraryTests
//
//  Created by 2403464 on 25/08/25.
//

import Testing
@testable import PhotoLibrary

struct PhotoListViewModelTest {
    
    @Test("Successfully fetches photo list items")
    func testFetchSuccess() async {
        // Given
        let mockService = MockService()
        let viewModel = PhotoListViewModel(apiServive: mockService)
        
        // When
        await viewModel.fetchPhotoListItems()
        
        // Then
        #expect(viewModel.photoListItems.count == 1)
        #expect(viewModel.photoListItems[0].title == "New")
        #expect(!viewModel.isLoading)
        #expect(viewModel.errorMessage == nil)
    }
    
    @Test("Handles fetch failure correctly")
    func testFetchFailure() async {
        // Given
        let mockService = MockService()
        mockService.apiFail = true
        let viewModel = PhotoListViewModel(apiServive: mockService)
        
        // When
        await viewModel.fetchPhotoListItems()
        
        // Then
        #expect(viewModel.photoListItems.isEmpty)
        #expect(!viewModel.isLoading)
        #expect(viewModel.errorMessage != nil)
    }
    
    @Test("Has correct initial state")
    func testInitialState() {
        // Given
        let viewModel = PhotoListViewModel(apiServive: MockService())
        
        // Then
        #expect(viewModel.photoListItems.isEmpty)
        #expect(viewModel.isLoading)
        #expect(viewModel.errorMessage == nil)
    }
}
