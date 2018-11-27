//
//  AppointmentHeader.swift
//  Appointments
//
//  Created by Matt Mejia on 11/27/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

class AppointmentHeader: UITableViewCell {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setup(header:String) {
        self.topLabel.text = header
//        self.segmentedControl[0].text = header.segmentedControlText1
//        self.segmentedControl[1].text = header.segmentedControlText2
        
//        self.segmentedControl.setTitle(header.segmentedControlText1, forSegmentAt: 0)
//        self.segmentedControl.setTitle(header.segmentedControlText2, forSegmentAt: 1)
    }

}
