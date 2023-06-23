//
//  AddMomentView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI

struct AddMomentView: View {
    @Environment(\.presentationMode) private var presentationMode

    @State var capturedImage: UIImage? = nil
    @State var isEditMomentsViewPresented = false
    
    let cameraService = CameraService()
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                    } else {
                        print("Error: no image data found")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: width * 0.08)
                    }
                    .padding(.leading, width * 0.07)
                    Spacer()
                }
                .padding(.bottom)
                .frame(width: width, height: height * 0.1)
                .background(.black)
                
                Spacer()
                
                HStack {
                    Button {
                        cameraService.capturePhoto()
                        isEditMomentsViewPresented.toggle()
                    } label: {
                        Image(systemName: "circle.inset.filled")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: width * 0.3)
                    }
                    .padding(.top)
                    .frame(width: width, height: height * 0.2)
                    .background(.black)
                }
            }
            
            if isEditMomentsViewPresented && capturedImage != nil {
                AddMomentRenameView(isEditMomentsViewPresented: $isEditMomentsViewPresented, capturedImage: capturedImage!, width: width, height: height)
            }
        }
    }
}
