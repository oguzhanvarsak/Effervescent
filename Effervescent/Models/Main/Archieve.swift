//
//  Archieve.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import Foundation

/**
 Archived threads are read-only threads that are are closed to new replies and images. Threads are archived when they are pushed off the last page of a board. Archived threads and their attachments remain viewable for a specific amount of time before they are automatically deleted from 4chan. It's important to note that not all boards have archives enabled.
 
 Example url:  https://a.4cdn.org/r9k/archive.json
 Status 200 : Content-Type: application/json
 */

struct Archieve: Decodable {
    
}
