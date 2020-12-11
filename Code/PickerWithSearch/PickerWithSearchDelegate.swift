//
//  PickerWithSearchDelegate.swift
//  PickerWithSearch
//
//  Created by Hadi on 12/11/20.
//

import Foundation

protocol PickerWithSearchDelegate: class {
    func pickerWithSearch(_ pickerWithSearch: PickerWithSearchViewController, didSelect item: PickerModel)
}
