//
//  LessonDatabase.swift
//  ComeFollowMe
//
//  Created by Kyle Gill on 12/5/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation
import GRDB

class LessonDatabase {
    
    // MARK: - Constants
    
    struct Constant {
        static let fileName = "comefollowme"
        static let fileExtension = "sqlite"
    }
    
    // MARK: - Properties
    var dbQueue: DatabaseQueue!
    
    // MARK: - Singleton
    static let sharedLessonDatabase = LessonDatabase()
    
    fileprivate init() {
        dbQueue = try? DatabaseQueue(path: Bundle.main.path(forResource: Constant.fileName,
                                                            ofType: Constant.fileExtension)!)
    }
    
    // MARK: - Helpers
    //
    // Return an array of strings listing the titles of all lessons
    //
    func lessons() -> [String] {
        do {
            let lessons = try dbQueue.inDatabase { (db: Database) -> [String] in
                var lessons = [String]()
                for row in try Row.fetchAll(db,
                                            "select name from \(Lesson.databaseTableName)", arguments: [ ]) {
                                                lessons.append(row[0])
                }
                return lessons
            }
            return lessons
        } catch {
            return []
        }
    }
}
