//
//  Threads.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import Foundation

struct Threads: Decodable {
    var no: Int?
    var last_nodified: Int?
    var replies: Int?
    
    var sticky: Int?
    var resto: Int?
    var closed: Int?
    var now: String?
    var time: Int?
    var name: String?
    var trip: String?
    var id: String?
    var capcode: String?
    var country: String?
    var country_name: String?
    var sub: String?
    var com: String?
    var tim: Int?
    var filename: String?
    var ext: String?
    var fsize: Int?
    var md5: String?
    var w: Int?
    var h: Int?
    var tn_w: Int?
    var tn_h: Int?
    var filedeleted: Int?
    var spoiler: Int?
    var custom_spoiler: Int?
    var omitted_posts: Int?
    var omitted_images: Int?
    var images: Int?
    var bumplimit: Int?
    var imagelimit: Int?
    var tag: String?
    var semantic_url: String?
    var since4pass: Int?
    var unique_ips: Int?
    var m_img: Int?
    var last_replies: [LastReplies]?
}
