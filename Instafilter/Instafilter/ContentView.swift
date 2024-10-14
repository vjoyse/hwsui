//
//  ContentView.swift
//  Instafilter
//
//  Created by Joyse Vargas on 10/9/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.3
    @State private var showingImagePicker = false
    @State private var showingFilterSheet = false
    @State private var showNoImageError = false
    @State private var changeFilterButtonText = "Change Filter"
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    let context = CIContext()
    
    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        let radius = Binding<Double>(
            get: {
                self.filterRadius
            },
            set: {
                self.filterRadius = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }.padding(.vertical)
                
                HStack {
                    Text("Radius")
                    Slider(value: radius)
                }.padding(.vertical)
                
                HStack{
                    Button(action: {
                        self.showingFilterSheet = true
                    }) {
                        Text(changeFilterButtonText)
                    }
                    Spacer()
                    Button("Save"){
                        guard let processedImage = self.processedImage else {
                            showNoImageError = true
                            return
                        }
                        
                        let imageSaver = ImageSaver()
                        imageSaver.successHandler = {
                            print("Success")
                        }
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotAlbum(image: processedImage)
                    }
                    .alert(isPresented: $showNoImageError){
                        Alert(title: Text("Important Message"), message: Text("No image selected"), dismissButton: .default(Text("Close")))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet){
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystallize"))
                    {
                        self.setFilter(CIFilter.crystallize())
                        changeFilterButtonText = "Filter Selected: Crystallize"
                    },
                    .default(Text("Edges"))
                    {
                        self.setFilter(CIFilter.edges())
                        changeFilterButtonText = "Filter Selected: Edges"
                    },
                    .default(Text("Gaussian Blur"))
                    {
                        self.setFilter(CIFilter.gaussianBlur())
                        changeFilterButtonText = "Filter Selected: Gaussian Blur"
                    },
                    .default(Text("Pixellate"))
                    {
                        self.setFilter(CIFilter.pixellate())
                        changeFilterButtonText = "Filter Selected: Pixellate"
                    },
                    .default(Text("Sepia Tone"))
                    {
                        self.setFilter(CIFilter.sepiaTone())
                        changeFilterButtonText = "Filter Selected: Sepia Tone"
                    },
                    .default(Text("Unsharp Mask"))
                    { 
                        self.setFilter(CIFilter.unsharpMask())
                        changeFilterButtonText = "Filter Selected: Unsharp Mask"
                    },
                    .default(Text("Vignette"))
                    {
                        self.setFilter(CIFilter.vignette())
                        changeFilterButtonText = "Filter Selected: Vignette"
                    },
                    .cancel()
                ])
            }
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func applyProcessing() {
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func getCurrentFilterName() -> String {
        switch self.currentFilter {
        case CIFilter.crystallize():
            return "Crystallize"
        case CIFilter.edges():
            return "Edges"
        case CIFilter.gaussianBlur():
            return "Gaussian Blur"
        case CIFilter.pixellate():
            return "Pixellate"
        case CIFilter.sepiaTone():
            return "Sephia Tone"
        case CIFilter.unsharpMask():
            return "Unsharp Mask"
        case CIFilter.vignette():
            return "Vignette"

        default:
            return "Change Filter"
        }
    }
}

#Preview {
    ContentView()
}
