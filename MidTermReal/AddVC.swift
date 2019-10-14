//
//  AddVC.swift
//  MidTermReal
//
//  Created by Margulan Sugirbay on 10/14/19.
//  Copyright © 2019 Margulan Sugirbay. All rights reserved.
//

import UIKit
protocol addAlarm{
    func add(alarm:Alarm)
}

class AddVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    var delegate:addAlarm?
    var hours = 0
       var minutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)

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
    
    @IBAction func save(_ sender: Any) {
        let editedTime = "\(hours):\(minutes)"
        let title = textField.text!
        let currentAlarm = Alarm(time: editedTime, description: title, switchs: false)
        delegate?.add(alarm: currentAlarm)
        self.dismiss(animated: true, completion: nil)
        print(currentAlarm)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
