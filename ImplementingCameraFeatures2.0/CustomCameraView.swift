//
//  CustomCameraView.swift
//  ImplementingCameraFeature
//
//  Created by Domenico Merola on 12/11/25.
//

import SwiftUI
import AVFoundation

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?

    @Environment(\.presentationMode) private var presentationMode
 //   @State private var isReady = false
 //   @State private var lastError: String?

    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data : data)
                        //presentationMode.wrappedValue.dismiss()
                    } else {
                        print("Error: No image data found")
                    }
                case .failure(_):
                    print("errore failure")
                }
            }
            
            

            VStack {
                Spacer()
                Button(action: {
                    cameraService.capturePhoto()
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                })
                .padding(.bottom)
               
            }
        }
        
    }
}
