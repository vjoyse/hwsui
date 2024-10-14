//
//  03_core_image.swift
//  Instafilter
//
//  Created by Joyse Vargas on 11/9/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct _3_core_image: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFill()
        }
        .onAppear(perform: loadImage)
    }
    
    
    func loadImage() {
        guard let inputImage = UIImage(named:  "Goku") else
        {
            return
        }
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        let pixelFilter = CIFilter.pixellate()
        pixelFilter.inputImage = beginImage
        pixelFilter.scale = 50
        
        let crystalFilter = CIFilter.crystallize()
        crystalFilter.setValue(beginImage, forKey: kCIInputImageKey)
        crystalFilter.radius = 200
        
        guard let twirlFilter = CIFilter(name: "CITwirlDistortion")
        else { return }
        twirlFilter.setValue(beginImage, forKey: kCIInputImageKey)
        twirlFilter.setValue(2000, forKey: kCIInputRadiusKey)
        twirlFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        //get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        //guard let outputImage = pixelFilter.outputImage else { return }
        
        //guard let outputImage = twirlFilter.outputImage else { return }
        
        //attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            //convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            
            //and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    _3_core_image()
}
