//
//  LessonsViewController.swift
//  ComeFollowMe
//
//  Created by Kyle Gill on 12/5/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit

class LessonsViewController : UITableViewController {
    // MARK - Constants
    private struct Storyboard {
        static let LessonCellIdentifier = "LessonTitleCell"
        static let ShowLessonSegue = "ShowLesson"
    }
    
    // MARK - Properties
    var lessons = LessonDatabase.sharedLessonDatabase.lessons()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowLessonSegue {
            if let lessonVC = segue.destination as? LessonViewController {
                if let indexPath = sender as? IndexPath {
                    lessonVC.lesson = lessons[indexPath.row]
                }
            }
        }
    }
    
    // MARK - Table View data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.LessonCellIdentifier, for: indexPath)
        puts(lessons[indexPath.row])
        cell.textLabel?.text = lessons[indexPath.row]
        
        return cell
    }
    
    // MARK - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowLessonSegue, sender: indexPath)
    }
}
