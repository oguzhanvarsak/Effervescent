//
//  Boards.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import Foundation

/**
 The boards.json file is a comprehensive list of all boards and their major settings.
 
 Example url:  https://a.4cdn.org/boards.json
 Status 200 :  Content-Type: application/json
 
 integer 1 = (on) or 0 (off)
 */
struct Boards: Decodable {
    var board: String?
    var title: String?
    var ws_board: Int?
    var per_page: Int?
    var pages: Int?
    var max_filesize: Int?
    var max_comment_chars: Int?
    var max_webm_duration: Int?
    var bump_limit: Int?
    var image_limit: Int?
    var cooldowns: Cooldowns?
    var meta_description: String?
    var spoilers: Int?
    var custom_spoilers: Int?
    var is_archived: Int?
    // var board_flags: Array
    var country_flags: Int?
    var user_ids: Int?
    var oekaki: Int?
    var sjis_tags: Int?
    var code_tags: Int?
    var math_tags: Int?
    var text_only: Int?
    var forced_anon: Int?
    var webm_audio: Int?
    var require_subject: Int?
    var min_image_width: Int?
    var min_image_height: Int?
}
