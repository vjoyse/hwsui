//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Joyse Vargas on 3/5/24.
//

import SwiftUI

enum alerts{
    case confirmation, somethingWrong
}

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var isSomethingWrong = false
    @State private var showAlert = false
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                self.showAlert = true
                self.isSomethingWrong = true
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showAlert = true
                self.showingConfirmation = true
            } else {
                print ("Invalid response from server")
            }
        }.resume()
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showAlert){
            Alert(title: Text("Thank you"), message: Text(confirmationMessage), dismissButton: .default(Text("Ok")))
//            switch alerts {
//            case .confirmation:
//                return Alert(title: Text("Thank you"), message: Text(confirmationMessage), dismissButton: .default(Text("Ok")))
//            }
//        case .somethingWrong:
//            return Alert(title: Text("Something wrong!"), message: Text("Something went wrong trying to place your order. Please try later!"), dismissButton: .default(Text("Ok")))
            
        }
        .navigationBarTitle("Check out")
    }
}

#Preview {
    CheckoutView(order: Order())
}
