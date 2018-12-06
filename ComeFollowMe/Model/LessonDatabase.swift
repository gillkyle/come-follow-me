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
    // Return an array of lessons 
    //
    func lessons() -> [Lesson] {
        do {
            let lessons = try dbQueue.inDatabase { (db: Database) -> [Lesson] in
                var lessons = [Lesson]()
                for row in try Row.fetchAll(db,
                    "select name from \(Lesson.databaseTableName)", arguments: [ ]) {
                        lessons.append(Lesson(row: row))
                }
                return lessons
            }
            return lessons
        } catch {
            return []
        }
    }
    //
    // Return an array of lesson titles
    //
    func lessonTitles() -> [String] {
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
    //
    // Returns a specific lesson for a given id
    //
    func lessonForId(_ lessonId: Int) -> Lesson {
        do {
            let lesson = try dbQueue.inDatabase { (db: Database) -> Lesson in
                let row = try Row.fetchOne(db,
                                           "select * from \(Lesson.databaseTableName) " +
                    "where \(Lesson.id) = ?",
                    arguments: [ lessonId ])
                if let returnedRow = row {
                    return Lesson(row: returnedRow)
                }
                
                return Lesson()
            }
            
            return lesson
        } catch {
            return Lesson()
        }
    }
}
