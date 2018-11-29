//
//  AppointmentHeader.swift
//  Appointments
//
//  Created by Matt Mejia on 11/27/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

protocol BDelegate {
    func switchLists(item:Int) -> [Appointment]
}

class AppointmentHeader: UITableViewCell {
    
    var delegate:BDelegate?
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBAction func segmentedController(_ sender: Any) {
//        switch segmentedControl.selectedSegmentIndex {
//        case 0:
////            topLabel.text = "First segment selected.";
//            delegate?.switchLists(item: 0)
//        case 1:
////            topLabel.text = "Second segment selected.";
//            delegate?.switchLists(item: 1)
//        default:
//            topLabel.text = "Label";
//        }

        delegate?.switchLists(item: segmentedControl.selectedSegmentIndex)
        
    }
    
    
    
//    @IBAction func segmentedController(_ sender: Any) {
//    }
//
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    func setup(header:String) {
        self.topLabel.text = header

    }
    

}
