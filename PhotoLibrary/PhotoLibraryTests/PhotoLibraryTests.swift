//
//  PhotoLibraryTests.swift
//  PhotoLibraryTests
//
//  Created by 2403464 on 25/08/25.
//

import Testing
@testable import PhotoLibrary
import XCTest
import ViewInspector
import SwiftUI

class MockService: APIProtocol {
    var apiFail = false
    func fetchData() async throws -> [PhotoLibrary.PhotoEntity] {
        if apiFail {
            throw URLError(.badServerResponse)
        }
        return [PhotoEntity(albumId: 1, id: 1, title: "New", url: "http://123.com", thumbnailUrl: "http://345.com")]
    }
}

//ViewModel Test

final class PhotoListViewModelTests: XCTestCase {
    // For success
    func fetchPhotoListSuccess() async {
        let mockService = MockService()
        let viewModel = PhotoListViewModel(apiServive: mockService)
        
        await viewModel.fetchPhotoListItems()
        
        XCTAssertEqual(viewModel.photoListItems.count, 1)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // For Failure
    func fetchPhotoListFailure() async {
        let mockService = MockService()
        mockService.apiFail = true
        let viewModel = PhotoListViewModel(apiServive: mockService)
        
        await viewModel.fetchPhotoListItems()
        
        XCTAssertTrue(viewModel.photoListItems.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
}


// PhotoList Row Tests
final class PhotoListRowTests: XCTestCase {
    // Validate text
    func testText() throws {
        let photoListItem = PhotoEntity(albumId: 2, id: 3, title: "Test11", url: "http://www.777.com", thumbnailUrl: "http://www.7787.com")
        let view = PhotoListRow(photoListItem: photoListItem)
        
        let text = try view.inspect().find(ViewType.Text.self).string()
        XCTAssertEqual(text, "Test11")
    }
    
    func testImage() throws {
        let item = PhotoEntity(albumId: 2, id: 1, title: "Test Text", url: "https://example.com/image.jpg", thumbnailUrl: "http://www.7787.com")
        let view = PhotoListRow(photoListItem: item)
        XCTAssertNoThrow(try view.inspect().find(ViewType.AsyncImage.self))
    }
    
}


