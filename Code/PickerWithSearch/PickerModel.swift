//
//  PickerModel.swift
//  PickerWithSearch
//
//  Created by Hadi on 12/11/20.
//

import Foundation

internal struct PickerModel: Codable {
    
    let id : Int?
    let title: String?
    let imageString: String?
    
    init(id: Int? = nil, title: String? = nil, imageString: String? = nil) {
        self.id = id
        self.title = title
        self.imageString = imageString
    }
    
    func contains(_ string: String) -> Bool {
        return title?.lowercased().contains(string.lowercased()) ?? false
    }
    
    func string() -> String {
        return title ?? ""
    }
}

extension PickerModel: Equatable, Comparable {
    
    static func ==(lhs: PickerModel, rhs: PickerModel) -> Bool {
        return lhs.title == rhs.title && lhs.id == rhs.id && lhs.imageString == rhs.imageString
    }
    
    static func <(lhs: PickerModel, rhs: PickerModel) -> Bool {
        return lhs.title ?? "" < rhs.title ?? ""
    }
    
    static func <=(lhs: PickerModel, rhs: PickerModel) -> Bool {
        return lhs.title ?? "" <= rhs.title ?? ""
    }
    
    static func >=(lhs: PickerModel, rhs: PickerModel) -> Bool {
        return lhs.title ?? "" >= rhs.title ?? ""
    }
    
    static func >(lhs: PickerModel, rhs: PickerModel) -> Bool {
        return lhs.title ?? "" > rhs.title ?? ""
    }
    
}
