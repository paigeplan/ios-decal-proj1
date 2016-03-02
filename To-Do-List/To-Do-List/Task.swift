//
//  Task.swift
//  To-Do-List
//
//  Created by Paige Plander on 3/1/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import Foundation


class Task {
    var title: String = ""
    var date: String = ""
    var completed: Bool = false
    var completedDate: NSDate = NSDate()
    
    init(title: String, date: String, completed: Bool) {
        self.title = title
        self.date = date
        self.completed = completed
    }
}