//
//  Utils.swift
//  MiAppPickerView
//
//  Created by CICE on 20/01/2022.
//

import Foundation
import UIKit

class Utils{
    
    // Patron Singleton
    static let shared = Utils()
    
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textxFields: UITextField,
                                 dataArray: [String]){
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textxFields.inputView = pickerView
        textxFields.text = dataArray[0]
        
        
    }
    
}
