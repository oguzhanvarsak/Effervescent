//
//  GeneralSettings.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import Foundation

struct GeneralSettings {
    /**
     Endpoints and Domains
     ```
     https://github.com/4chan/4chan-API/blob/master/pages/Endpoints_and_domains.md
     ```
     */
    struct url {
        /// A list of all boards and their attributes.
        /// https://a.4cdn.org/boards.json
        /// Documentation Page - https://github.com/4chan/4chan-API/blob/master/pages/Boards.md
        static var boards = "https://a.4cdn.org/boards.json"
        
        /// A summarized list of all threads on a board including thread numbers, their modification time and reply count.
        /// https://a.4cdn.org/po/threads.json
        /// /// Documentation Page - https://github.com/4chan/4chan-API/blob/master/pages/Threadlist.md
        static var threads = "https://a.4cdn.org/%@/threads.json"
        
        /// A JSON representation of a board catalog. Includes all OPs and their preview replies.
        /// https://a.4cdn.org/po/catalog.json
        /// /// Documentation Page - https://github.com/4chan/4chan-API/blob/master/pages/Catalog.md
        static var catalog = "https://a.4cdn.org/%@/catalog.json"
        
        /// A list of all closed threads in a board archive. Archived threads no longer receive posts.
        /// https://a.4cdn.org/po/archive.json
        /// /// Documentation Page - https://github.com/4chan/4chan-API/blob/master/pages/Archive.md
        static var archieve = "https://a.4cdn.org/%@/archive.json"
        
        /// A list of threads and their preview replies from a specified index page. Index pages start at 1. The maximum number of pages (can be found in boards.json) may vary depending on the board.
        /// https://a.4cdn.org/po/3.json
        /// /// Documentation Page - https://github.com/4chan/4chan-API/blob/master/pages/Indexes.md
        static var indexes = "https://a.4cdn.org/%@/%@.json"
        
        /// A full list of posts in a single thread.
        /// https://a.4cdn.org/po/thread/570368.json
        /// /// Documentation Page - https://github.com/4chan/4chan-API/blob/master/pages/Threads.md
        static var thread = "https://a.4cdn.org/%@/thread/%@.json"
        
        /// This is the primary content domain used for serving user submitted media attached to posts.
        /// https://i.4cdn.org/a/1636286583580.png
        static var image = "https://i.4cdn.org/%@/%@"
    }
}
