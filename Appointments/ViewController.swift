//
//  ViewController.swift
//  Appointments
//
//  Created by Matt Mejia on 11/27/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

// Can be a string. By default, int.

enum AppointmentType: Int {
//    case past
//    case upcoming
    
    case list1
    case list2

}

//enum HttpCode: Int {
//    case ok = 200
//    case notFound = 404
//    case forbidden = 401
//    case serverError = 500
//}

class ViewController: UIViewController, BDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentSelection:Int = 0
    
    var items:[Appointment] = []
    
    func switchLists(item: Int) -> [Appointment] {
        print(item)
        switch item {
        case 0:
            items = filterLists(currentList: .list1)

        case 1:
            items = filterLists(currentList: .list2)
        default:
            items = []
        }
        currentSelection = item
        tableView.reloadSections([0, 1], with: .fade)
        return items

    }
    
    func filterLists(currentList: AppointmentType) -> [Appointment] {
        
        var workingArray: [Appointment] = []
        //    var currentList = AppointmentType.list1
        //    currentList = .list2
        
        switch currentList {
        case .list1:
            workingArray.append(Appointment(image: "user", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer"));
            workingArray.append(Appointment(image: "user", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer"));
            workingArray.append(Appointment(image: "user", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher"));
        //        return workingArray
        case .list2:
            workingArray.append(Appointment(image: "user", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer"))
            workingArray.append(Appointment(image: "user", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer"))
            //        return workingArray
            //    default:
            ////        return inputArray
            //        break
        }
        
        return workingArray
        
    }

    
    
    var emptyItems:[Appointment] = []
//    var items:[Appointment] = filterLists(inputArray: [])
    var headerLabels:[Header] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        items.append(Appointment(image: "user", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer"))
//        items.append(Appointment(image: "user", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer"))
//        items.append(Appointment(image: "user", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher"))
//        items.append(Appointment(image: "user", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer"))
//        items.append(Appointment(image: "user", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer"))
        
        items = filterLists(currentList: .list1)
        
        tableView.register(UINib(nibName: "AppointmentHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
//        var sc = 200
//
//        switch sc {
//        case HttpCode.ok.rawValue:
//            break
//        default:
//            break
//        }
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
        
        print("Size: ", items.count)
        
        return items.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AppointmentTableViewCell else { return UITableViewCell() }
        
        

        let item = items[indexPath.row]
        cell.setup(appointment: item)
        
        return cell
    }
    


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? AppointmentHeader else { return UITableViewCell() }

        headerCell.delegate = self
        headerCell.setup(header: "Test", currentSelection: currentSelection)
        return headerCell
    }
    
    
}

