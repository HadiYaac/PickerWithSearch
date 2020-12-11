//
//  ViewController.swift
//  PickerWithSearch
//
//  Created by Hadi on 12/11/20.
//

import UIKit

public class PickerWithSearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
        
    var pickerModelsArray = [PickerModel]()
    
    class func getVC(withDelegate delegate: PickerWithSearchDelegate) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Picker", bundle: Bundle(for: PickerWithSearchViewController.self))
        let nc = storyboard.instantiateInitialViewController() as! UINavigationController
        if let vc = nc.topViewController as? PickerWithSearchViewController {
            vc.delegate = delegate
        }
        return nc
    }
    
    lazy var dataSource: PickerWithSearchDatasource = {
        let ds = PickerWithSearchDatasource(tableView: self.tableView)
        ds.delegate = self
        return ds
    }()
    
    weak var delegate: PickerWithSearchDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()
        dataSource.items = pickerModelsArray
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.searchBar.becomeFirstResponder()
        }
    }
    
    private func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .onDrag
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    
    @IBAction func dismissTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PickerWithSearchViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.filter(searchText)
        tableView.reloadData()
    }
}

extension PickerWithSearchViewController: PickerWithSearchDataSourceDelegate {
    func pickerWithSearchDataSource(_ pickerWithSearchDataSource: PickerWithSearchDatasource, didSelect item: PickerModel) {
        delegate?.pickerWithSearch(self, didSelect: item)
        self.dismiss(animated: true, completion: nil)
    }
}

