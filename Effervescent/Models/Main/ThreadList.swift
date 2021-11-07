//
//  ThreadList.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import Foundation

/**
 The threads.json file is a comprehensive list of all threads that contains:
    - The thread OP number
    - The index page the thread is currently on
    - A UNIX timestamp marking the last time the thread was modified
    - The number of replies a thread has
 
 Example url :  https://a.4cdn.org/po/threads.json
 Status 200 : Content-Type: application/json
 
 integer 1 = (on) or 0 (off)
*/
struct ThreadList: Decodable {
    var page: Int?
    var threads: [Threads]?
    var posts: [Threads]?
}
