//
//  StatsViewController.swift
//  To-Do-List
//
//  Created by Paige Plander on 2/23/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, ToDoListViewController {

    var dataModel = DataModel()
    
    @IBOutlet weak var countNumberLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countNumberLabel.text = String(dataModel.completedTasksCount)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
