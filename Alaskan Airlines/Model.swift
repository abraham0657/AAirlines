//
//  Model.swift
//  Alaskan Airlines
//
//  Created by Abraham Tesfamariam on 10/31/17.
//  Copyright © 2017 RJT Compuquest. All rights reserved.
//

import Foundation

struct Flights: Decodable {
    var departTime, arriveTime: Date?
    var flightID, origAirport, destAirport: String
    
    private enum CodingKeys: String, CodingKey {
        case departTime = "SchedDepTime"
        case arriveTime = "SchedArrTime"
        case flightID = "FltId"
        case origAirport = "Orig"
        case destAirport = "Dest"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var departingTime = try container.decode(String.self, forKey: .departTime)
        var arrivingTime = try container.decode(String.self, forKey: .arriveTime)
        self.flightID = try container.decode(String.self, forKey: .flightID)
        self.origAirport = try container.decode(String.self, forKey: .origAirport)
        self.destAirport = try container.decode(String.self, forKey: .destAirport)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        departingTime = departingTime.replacingOccurrences(of: "T", with: " ")
        arrivingTime = arrivingTime.replacingOccurrences(of: "T", with: " ")
        
        if let time = formatter.date(from: departingTime) {
            departTime = time
        }
        
        if let time = formatter.date(from: arrivingTime) {
            arriveTime = time
        }
    }
}

class FlightService {
    static let shared = FlightService()
    
    func fetchFlights(airport: String, pastMinutes: Int, futureMinutes: Int, completion: @escaping ([Flights]) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.qa.alaskaair.com/1/airports/\(airport)/flights/\(pastMinutes)/\(futureMinutes)")!)
        request.setValue("Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM=", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                do {
                    if let flightData = data {
                        let flightsArray = try JSONDecoder().decode([Flights].self, from: flightData)
                        completion(flightsArray)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
