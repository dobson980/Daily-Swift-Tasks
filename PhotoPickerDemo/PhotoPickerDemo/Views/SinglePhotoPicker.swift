//
//  SinglePhotoPicker.swift
//  PhotoPickerDemo
//
//  Created by Thomas Dobson on 7/3/24.
//

import SwiftUI
import PhotosUI

struct SinglePhotoPicker: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var image: Image?
    
    var body: some View {
        
        VStack {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                (image ?? Image(systemName: "photo.artframe"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .padding(.bottom, 40)
            }
            .onChange(of: selectedItem) {
                Task {
                    if let newImage = try? await selectedItem?.loadTransferable(type: Image.self) {
                       image = newImage
                    } else {
                        print("failed")
                    }
                }
            }
            
            Text("Upload an Image")
        }
    }
}

#Preview {
    SinglePhotoPicker()
}
