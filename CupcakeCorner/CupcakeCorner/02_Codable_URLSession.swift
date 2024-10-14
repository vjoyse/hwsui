//
//  Codable_URLSession.swift
//  CupcakeCorner
//
//  Created by Joyse Vargas on 19/4/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct _2_Codable_URLSession: View {
    @State private var results = [Result]()
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let decodedResponse = try?
                    JSONDecoder().decode(Response.self, from: data) {
                    // Data is ok, go back to the main thread.
                    DispatchQueue.main.async {
                        //update our UI
                        self.results = decodedResponse.results
                    }
                    //everything is good, so we can exit.
                    return
                }
            }
            //if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName).font(.headline)
                Text(item.collectionName)
            }
        }.onAppear(perform: loadData)
    }
}

#Preview {
    _2_Codable_URLSession()
}
