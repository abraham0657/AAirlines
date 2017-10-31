//
//  Model.swift
//  Alaskan Airlines
//
//  Created by Abraham Tesfamariam on 10/31/17.
//  Copyright © 2017 RJT Compuquest. All rights reserved.
//

import Foundation

struct Flights {
    let date: Date
}

class Model {
    static let shared = Model()
    
    func fetchFlights(minutesPast: Int, minutesFuture: Int, completion: @escaping ([Flights]) -> Void) {
        
    }
}
