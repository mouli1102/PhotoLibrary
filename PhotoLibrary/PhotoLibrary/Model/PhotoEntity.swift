
//
//  Untitled.swift
//  PhotoLibrary
//
//  Created by 2403464 on 25/08/25.
//
import Foundation

/// A model representing a photo item from  API.
struct PhotoEntity: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
