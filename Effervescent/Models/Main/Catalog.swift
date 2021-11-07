//
//  Catalog.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import Foundation

/**
 The catalog.json file is a comprehensive list of all threads+attributes on a board. Every thread is grouped by page. This file is a JSON representation of a board catalog page
 
 Example url:  https://a.4cdn.org/po/catalog.json
 Status 200 :  Content-Type: application/json
*/
struct Catalog: Decodable {
    var page: Int?
    var threads: [Threads]?
}
