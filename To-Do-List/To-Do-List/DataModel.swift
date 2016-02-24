//
//  DataModel.swift
//  To-Do-List
//
//  Created by Paige Plander on 2/23/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import Foundation

class DataModel {

    struct Task {
        var title: String = ""
        var date: String = ""
        
    }
    
    var tasks: [Task] = []
    
    func createTask(title: String, date: String) {
        var newTask = Task()
        newTask.title = title
        newTask.date = date
        tasks.append(newTask)
        
    }
    
}