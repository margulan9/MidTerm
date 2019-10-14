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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        let time = "17:20"
        let title = textField.text!
        let currentAlarm = Alarm(time: time, description: title, switchs: false)
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
