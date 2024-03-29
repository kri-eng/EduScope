//
//  DataManager.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import Foundation

//protocol DataManagerDelegate {
//    // func didUpdateData(_ schoolData: [SchoolData])
//    func didUpdateSATData(_ schoolSATData: [SchoolSATData])
//}

struct DataManager {
    
    // MARK: - Variable Declaration
    let schoolDataURL: String = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let schoolSATDataURL: String = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    // var delegate: DataManagerDelegate?
    
    // MARK: - School Data Retrieval
    
    // Fetches the Data.
    func fetchSchoolData(completionHandler: @escaping (([SchoolData]) -> ())) {
        // Create a URL
        if let url = URL(string: schoolDataURL) {
            // Create a URL Session
            let session = URLSession(configuration: .default)
            
            // Create a task
            let task = session.dataTask(with: url) { data, urlResponse, error in
                // Check for error
                if error != nil {
                    print("Error while generating a dataTask: \(error!)")
                } else {
                    // Check data for nil.
                    if let safeData = data {
                        // Parse the JSON Object.
                        if let schoolData = parseJSON(schoolData: safeData) {
                            // self.delegate?.didUpdateData(schoolData)
                            completionHandler(schoolData)
                        }
                    }
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    // Parse the JSON Data.
    func parseJSON(schoolData: Data) -> [SchoolData]? {
        
        // Create a decoder.
        let decoder = JSONDecoder()
        
        // Decode the data.
        do {
            let schoolData = try decoder.decode([SchoolData].self, from: schoolData)
            return schoolData
        } catch {
            print("Error while parsing JSON data: \(error)")
            return nil
        }
    }
    
    // MARK: - School SAT Data Retrieval
    
    // Fetches the Data.
    func fetchSchoolSATData(completionHandler: @escaping (([SchoolSATData]) -> ())) {
        // Create a URL
        if let url = URL(string: schoolSATDataURL) {
            // Create a URL Session
            let session = URLSession(configuration: .default)
            
            // Create a task
            let task = session.dataTask(with: url) { data, urlResponse, error in
                // Check for error
                if error != nil {
                    print("Error while generating a dataTask: \(error!)")
                } else {
                    // Check data for nil.
                    if let safeData = data {
                        // Parse the JSON Object.
                        if let schoolSATData = parseJSON(schoolSATData: safeData) {
                            completionHandler(schoolSATData)
                        }
                    }
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    // Parse the JSON Data.
    func parseJSON(schoolSATData: Data) -> [SchoolSATData]? {
        
        // Create a decoder.
        let decoder = JSONDecoder()
        
        // Decode the data.
        do {
            let schoolSATData = try decoder.decode([SchoolSATData].self, from: schoolSATData)
            return schoolSATData
        } catch {
            print("Error while parsing JSON data: \(error)")
            return nil
        }
    }
    
}
