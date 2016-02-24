//
//  ToDoListTableViewController.swift
//  To-Do-List
//
//  Created by Paige Plander on 2/18/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//



//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)
//        defaults.objectForKey(<#T##NSUserDefaults#>)



import UIKit

class ToDoListTableViewController: UITableViewController, ToDoListViewController {
    
    var dataModel = DataModel()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        dataModel.deleteCompletedTasksOver24HoursOld()
        tableView.reloadData()
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataModel.tasks.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        
        let taskAtIndexPath = dataModel.tasks[indexPath.row]
        cell.taskLabel.text = taskAtIndexPath.title
        cell.dateLabel.text = taskAtIndexPath.date
        if taskAtIndexPath.completed {
            cell.checkmarkView.image = UIImage(named: "checked")
        }
        else {
            cell.checkmarkView.image = UIImage(named: "unchecked")
        }


        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataModel.tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            

            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as!ToDoListTableViewCell
        
        let task = dataModel.tasks[indexPath.row]
        print("got here")
        
        
        if task.completed {
            currentCell.checkmarkView.image = UIImage(named: "unchecked")
            dataModel.completedTasksCount -= 1

        }
        else {
            currentCell.checkmarkView.image = UIImage(named: "checked")
            dataModel.completedTasksCount += 1

        }
        dataModel.toggleCompletedForTask(indexPath.row)
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        var destination = segue.destinationViewController as! ToDoListViewController
        destination.dataModel = dataModel
    }
   

}
