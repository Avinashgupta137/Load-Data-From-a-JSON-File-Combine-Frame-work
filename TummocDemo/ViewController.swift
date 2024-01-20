//
//  ViewController.swift
//  TummocDemo
//
//  Created by avinash on 20/01/24.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var cancellables: Set<AnyCancellable> = []
    
    let dataLoader = DataLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dataLoader.$userData
//            .sink { [weak self] userData in
//                print(userData)
//            }
//            .store(in: &cancellables)
//    }
        dataLoader.$userData
                   .sink { [weak self] temperatures in
                       if let firstTemperature = temperatures.first {
                           print(firstTemperature.categories)
                       }
                   }
                   .store(in: &cancellables)
           }
}
