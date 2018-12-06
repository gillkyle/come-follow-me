//
//  LessonViewController.swift
//  ComeFollowMe
//
//  Created by Kyle Gill on 12/5/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit

class LessonViewController : UITableViewController {
    // MARK - Constants
    private struct Storyboard {
        static let cornerRadius: CGFloat = 5.0
        static let borderWidth: CGFloat = 1.0
    }
    
    // MARK - Properties
    var lessonName = ""
    var lesson = Lesson()
    var lessonId = 1
    
    // MARK - Outlets
    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson Journal"
        
        updateModel()
        lessonTitle.text = lesson.name
        goalTextView.text = lesson.goal
        goalTextView.layer.cornerRadius = Storyboard.cornerRadius
        goalTextView.layer.borderColor = UIColor.lightGray.cgColor
        goalTextView.layer.borderWidth = Storyboard.borderWidth
        notesTextView.text = lesson.notes
        notesTextView.layer.cornerRadius = Storyboard.cornerRadius
        notesTextView.layer.borderColor = UIColor.lightGray.cgColor
        notesTextView.layer.borderWidth = Storyboard.borderWidth
    }
    
    // MARK - Helpers
    private func updateModel() {
        lesson = LessonDatabase.sharedLessonDatabase.lessonForId(lessonId)
    }
}
