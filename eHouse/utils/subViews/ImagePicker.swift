//
//  ImagePicker.swift
//  eHouse
//
//  Created by David Deschamps on 12/08/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    // Creer une classe imbriqué car on a besoin des methodes des protocole
    // UINavigationControllerDelegate et UIImagePickerControllerDelegate
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let imagePicked = info[.originalImage] as? UIImage {
                parent.image = imagePicked
            }

            parent.completion()
            parent.presentationMode.wrappedValue.dismiss()

        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    var completion : () -> ()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIViewController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    
    
    
}
