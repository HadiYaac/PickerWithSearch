//
//  PickerWithSearchDatasource.swift
//  PickerWithSearch
//
//  Created by Hadi on 12/11/20.
//

import Foundation
import UIKit

protocol PickerWithSearchDataSourceDelegate: class {
    func pickerWithSearchDataSource(_ pickerWithSearchDataSource: PickerWithSearchDatasource, didSelect item: PickerModel)
}

final class PickerWithSearchDatasource: NSObject {
    
    private let tableView: UITableView
    internal var items: [PickerModel] = []
    
    private var searchText = ""
    private var filteredItems: [PickerModel] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter({ return $0.contains(searchText) })
        }
    }
    
    weak var delegate: PickerWithSearchDataSourceDelegate?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func filter(_ searchString: String) {
        searchText = searchString
    }
    
}

extension PickerWithSearchDatasource: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filteredItems[indexPath.row].string()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = filteredItems[indexPath.item]
        delegate?.pickerWithSearchDataSource(self, didSelect: selectedItem)
    }
}
    
