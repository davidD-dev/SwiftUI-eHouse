//
//  ProfileView.swift
//  eHouse
//
//  Created by David Deschamps on 12/08/2021.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var profileImage : UIImage?
    @State private var showImagePIcker = false
    
    private var profileViewModel = ProfileViewModel()
    
    
    var body: some View {
        VStack {
            Button(action: { pickImage() }, label: {
                AvatarView()
            })
            if (profileImage != nil) {
                Image(uiImage: profileImage!)
                    .resizable()
                    .frame(width: 100, height: 100)
            }

        }
        .sheet(isPresented: $showImagePIcker) {
            ImagePicker(image: $profileImage, completion: completionImagePicker)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(onClick: onGoBackClick))
    }
    
    fileprivate func pickImage() {
        showImagePIcker = true
    }
    
    fileprivate func completionImagePicker() {
        if let image = profileImage {
            profileViewModel.saveImage(image: image)
        }
        
        if profileViewModel.updatePictureSuccessful {
            print("UPDATE SUCCESFULL")
        }
    }
    
    fileprivate func onGoBackClick() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
