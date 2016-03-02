//
//  DataModel.swift
//  To-Do-List
//
//  Created by Paige Plander on 2/23/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import Foundation

class DataModel {


    
    var tasks: [Task] = []
    var completedTasksCount = 0
    
    
    func createTask(title: String, date: String) {
        let newTask = Task(title: title, date: date, completed: false)
        tasks.append(newTask)
        
    }
    
    func toggleCompletedForTask(index: Int) {
        tasks[index].completed = !tasks[index].completed
        if tasks[index].completed {
            tasks[index].completedDate = NSDate()
        }
    }
    
    func deleteCompletedTasksOver24HoursOld() {
        var i = 0
        while i < tasks.count {
            if tasks[i].completed && olderThan24Hours(tasks[i].completedDate) {
                tasks.removeAtIndex(i)
                print("removing old tasks")
                completedTasksCount = completedTasksCount - 1
            }
            i++
        }
    }

    
    func olderThan24Hours(startingDate: NSDate) -> Bool{
        let hours = NSCalendar.currentCalendar().components(NSCalendarUnit.Hour, fromDate: startingDate, toDate: NSDate(), options: []).hour
        if hours >= 24 {
            return true
        }
        return false
    }
    
    
    
}