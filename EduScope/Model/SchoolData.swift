//
//  SchoolData.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import Foundation

struct SchoolData: Codable {
    let dbn: String
    let school_name: String
    let city: String
    let overview_paragraph: String
    let location: String
    let phone_number: String
    let website: String
    let latitude: String?
    let longitude: String?
}
