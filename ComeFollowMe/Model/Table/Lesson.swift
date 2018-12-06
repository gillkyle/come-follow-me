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
    var startdate: Date
    var enddate: Date
    
    static let databaseTableName = "lesson"
    
    static let id = "id"
    static let name = "name"
    static let notes = "notes"
    static let goal = "goal"
    static let startdate = "startdate"
    static let enddate = "enddate"
    
    init(row: Row) {
        id = row[Lesson.id]
        name = String(data: row[Lesson.name], encoding: .utf8)!
        notes = String(data: row[Lesson.notes], encoding: .utf8)!
        goal = String(data: row[Lesson.goal], encoding: .utf8)!
        startdate = row[Lesson.startdate]
        enddate = row[Lesson.enddate]
    }
}
