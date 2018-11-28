//
//  ViewController.swift
//  Appointments
//
//  Created by Matt Mejia on 11/27/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items:[Appointment] = []
    var headerLabels:[Header] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        items.append(Appointment(image: "user", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer"))
        items.append(Appointment(image: "user", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer"))
        items.append(Appointment(image: "user", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher"))
        items.append(Appointment(image: "user", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer"))
        items.append(Appointment(image: "user", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // will get an index out of bounds exception with this value.
//        return 10
        
        // will give the number of rows as the number of items in the array.
        return items.count
    }
    
//    func tableview
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AppointmentTableViewCell else { return UITableViewCell() }

        let item = items[indexPath.row]
        cell.setup(appointment: item)
        
//        cell.setup(appointment: <#T##Appointment#>)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewHeaderFooterView {
//
//        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerView") as? AppointmentHeader else { return UITableViewHeaderFooterView() }
//
//        let headerLabel = headerLabels[indexPath.row]
//        headerCell.setup(Header:headerLabel)
//        return headerCell
    
        

//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerView") as? AppointmentHeader else { return UITableViewCell() }
//        headerCell.topLabel.text = "Test"
        headerCell.setup(header: "Test")
        return headerCell
    }
}

