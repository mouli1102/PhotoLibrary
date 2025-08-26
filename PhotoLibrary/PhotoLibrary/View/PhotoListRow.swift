//
//  PhotoListRow.swift
//  PhotoLibrary
//
//  Created by 2403464 on 25/08/25.
//
import SwiftUI
import Foundation

/// A SwiftUI view that displays a photo item in a row format.
struct PhotoListRow: View {
    let photoListItem: PhotoEntity
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: photoListItem.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            }
            Text(photoListItem.title)
                .font(.body)
                .padding(.leading, 8)
            Spacer()
        }
        .padding(8)
    }
}
