//
//  TableViewController.swift
//  MidTermReal
//
//  Created by Margulan Sugirbay on 10/14/19.
//  Copyright © 2019 Margulan Sugirbay. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, addAlarm, deleteAlarm, editAlarm {
    func edit(index: Int, edited: Alarm) {
        alarmList[index] = edited
        tableView.reloadData()
    }
    
    func delete(index i: Int) {
        alarmList.remove(at: i)
        tableView.reloadData()
    }
    
    func add(alarm: Alarm) {
        alarmList.append(alarm)
        tableView.reloadData()
    }
    
    
    var alarmList = [Alarm]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmList.append(Alarm(time: "14:20", description: "midterm", switchs: false))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarmList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? TableViewCell
        cell?.timeLabel.text = alarmList[indexPath.row].time
        cell?.descriptionLabel.text = alarmList[indexPath.row].description

        // Configure the cell...

        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAlarm"{
            if let destination = segue.destination as? AddVC{
                destination.delegate = self
            }
        }else if segue.identifier == "editSegue"{
            if let destination = segue.destination as? ViewController{
                let index = (tableView.indexPathForSelectedRow?.row)!
                destination.global_title = alarmList[index].description
                destination.currentIndex = index
                destination.delegateDelete = self
                destination.delegateEdit = self
            }
        }
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
