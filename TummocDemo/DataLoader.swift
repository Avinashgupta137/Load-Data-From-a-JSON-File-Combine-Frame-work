//
//  DataLoader.swift
//  LoadfromJSON
//
//  Created by Ajay Gandecha on 12/15/19.
//  Copyright © 2019 Ajay Gandecha. All rights reserved.
//

import Foundation

public class DataLoader {
    
    // Change userData to be a Published property
    @Published var userData = [Temperatures]()
    
    init() {
        load { [weak self] data in
            if let data = data {
                self?.userData = [data]
            }
        }
    }

    func load(completion: @escaping (Temperatures?) -> Void) {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(Temperatures.self, from: data)
                completion(dataFromJson)
            } catch {
                print("Error loading JSON data:", error)
                completion(nil)
            }
        } else {
            print("Couldn't find the file location.")
            completion(nil)
        }
    }

}
