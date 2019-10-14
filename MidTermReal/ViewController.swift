//
//  ViewController.swift
//  MidTermReal
//
//  Created by Margulan Sugirbay on 10/14/19.
//  Copyright © 2019 Margulan Sugirbay. All rights reserved.
//

import UIKit
protocol deleteAlarm{
    func delete(index i: Int)
}
protocol editAlarm{
    func edit(index:Int, edited: Alarm)
}
class ViewController: UIViewController {

    @IBOutlet weak var datePicket: UIDatePicker!
    @IBOutlet weak var editTextField: UITextField!
    var delegateDelete:deleteAlarm?
    var delegateEdit:editAlarm?
    var currentIndex:Int?
    var global_title:String?
    var hours = 0
    var minutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.text = global_title
        datePicket.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: sender.date)
        if let hour = components.hour, let minute = components.minute{
            hours = hour
            minutes = minute
            print("\(hours) \(minutes)")
        }
    }


    @IBAction func edit(_ sender: Any) {
        let editedTime = "\(hours):\(minutes)"
        let editedText = editTextField.text
        let currentAlarm = Alarm(time: editedTime, description: editedText, switchs: true)
        delegateEdit?.edit(index: currentIndex!, edited: currentAlarm)
        navigationController?.popViewController(animated: true)

        
    }
    //delete button
    @IBAction func save(_ sender: Any) {
        delegateDelete?.delete(index: currentIndex!)
        navigationController?.popViewController(animated: true)
    }
}

