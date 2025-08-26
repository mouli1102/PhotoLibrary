//
//  PhotoListRowTests.swift
//  PhotoLibraryTests
//
//  Created by 2403464 on 25/08/25.
//

import Testing
@testable import PhotoLibrary


struct PhotoListRowTest {
    
    @Test("Creates row with correct data")
    func testRowCreation() {
        // Given
        let item = PhotoEntity(
            albumId: 1,
            id: 2,
            title: "Test Photo Title",
            url: "https://example.com/image.jpg",
            thumbnailUrl: "https://example.com/thumb.jpg"
        )
        
        // When
        let row = PhotoListRow(photoListItem: item)
        
        // Then
        #expect(row.photoListItem.title == "Test Photo Title")
        #expect(row.photoListItem.url == "https://example.com/image.jpg")
    }
    
    @Test("Row contains Text component")
        func testRowContainsText() {
            // Given
            let item = PhotoEntity(
                albumId: 1,
                id: 2,
                title: "Test Photo Title",
                url: "https://example.com/image.jpg",
                thumbnailUrl: "https://example.com/thumb.jpg"
            )
            
            // When
            let row = PhotoListRow(photoListItem: item)
            
            // Then - String description method
            let viewDescription = String(describing: row.body)
            #expect(viewDescription.contains("Test Photo Title"))
        }
        
        @Test("Row contains AsyncImage component")
        func testRowContainsAsyncImage() {
            // Given
            let item = PhotoEntity(
                albumId: 1,
                id: 2,
                title: "Test Photo Title",
                url: "https://example.com/image.jpg",
                thumbnailUrl: "https://example.com/thumb.jpg"
            )
            
            // When
            let row = PhotoListRow(photoListItem: item)
            
            // Then - String description method
            let viewDescription = String(describing: row.body)
            #expect(viewDescription.contains("AsyncImage"))
            
            // Alternative: URL check as proxy for AsyncImage
            #expect(viewDescription.contains("https://example.com/image.jpg"))
        }
}
