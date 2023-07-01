//
//  AddMomentView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI
import PhotosUI

struct AddMomentView: View {
    @Environment(\.presentationMode) private var presentationMode

    @State private var capturedImage: UIImage? = nil
    @State var isEditMomentsViewPresented = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var isManualInput : Bool = false
    let cameraService = CameraService()
    var width: CGFloat
    var height: CGFloat
    var shouldShowCamera : Bool
    
    var expenseAmount : String
    var categorySelected : CategoryModel
    var expenseDate : Date
    
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
                
                ZStack {
                    HStack {
                        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                            Image(systemName: "photo.on.rectangle")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .foregroundColor(.white)
                        }
                        .frame(width: width * 0.25)
                        .padding(.leading)
                        .onChange(of: selectedItem) { newValue in
                            Task {
                                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                    capturedImage = UIImage(data: data)
                                    isEditMomentsViewPresented.toggle()
                                    
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    
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
                    }
                }
                .padding(.top)
                .frame(width: width, height: height * 0.2)
                .background(.black)
            }
            
            .navigationDestination(isPresented: $isEditMomentsViewPresented) {
                if let capturedImage {
                    AddMomentRenameView(isEditMomentsViewPresented: $isEditMomentsViewPresented, isManualInput: $isManualInput, capturedImage: capturedImage, width: width, height: height, expenseAmount: expenseAmount, categorySelected: categorySelected, expenseDate: expenseDate)
                }
            }
        }
        .onAppear{
            isEditMomentsViewPresented = shouldShowCamera
        }
        .navigationBarBackButtonHidden()
    }
}
