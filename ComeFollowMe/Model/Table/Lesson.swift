//
//  Lesson.swift
//  ComeFollowMe
//
//  Created by Kyle Gill on 12/5/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation
import GRDB

struct Lesson : TableRecord, FetchableRecord {
    var id: Int
    var name: String
    var notes: String
    var goal: String
//    var startdate: Date
//    var enddate: Date
    var sdate: String
    var edate: String
    
    static let databaseTableName = "lesson"
    
    static let id = "id"
    static let name = "name"
    static let notes = "notes"
    static let goal = "goal"
//    static let startdate = "startdate"
//    static let enddate = "enddate"
    static let sdate = "sdate"
    static let edate = "edate"
    

    init() {
        id = 1
        name = ""
        notes = ""
        goal = ""
        sdate = ""
        edate = ""
    }
    
    init(row: Row) {
        id = row[Lesson.id]
        name = String(data: row[Lesson.name], encoding: .utf8)!
        notes = String(data: row[Lesson.notes], encoding: .utf8)!
        goal = String(data: row[Lesson.goal], encoding: .utf8)!
        sdate = String(data: row[Lesson.sdate], encoding: .utf8)!
        edate = String(data: row[Lesson.edate], encoding: .utf8)!
    }
}
