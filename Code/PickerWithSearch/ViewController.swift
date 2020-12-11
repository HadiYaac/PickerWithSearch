//
//  ViewController.swift
//  PickerWithSearch
//
//  Created by Hadi on 12/11/20.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var items : [PickerModel]! = []
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func presentPickerButtonTapped(_ sender: UIButton) {
        let pickerWithSearchNavVC = PickerWithSearchViewController.getVC(withDelegate: self)
        if let pickerVC = pickerWithSearchNavVC.topViewController as? PickerWithSearchViewController{
            pickerVC.pickerModelsArray = self.items
        }
        self.present(pickerWithSearchNavVC, animated: true, completion: nil)
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        items.append(PickerModel(id: 1, title: "Hadi", imageString: ""))
        items.append(PickerModel(id: 1, title: "Mojtaba", imageString: ""))
        items.append(PickerModel(id: 1, title: "Rafi", imageString: ""))
        items.append(PickerModel(id: 1, title: "Wassim", imageString: ""))
        items.append(PickerModel(id: 1, title: "Bawab", imageString: ""))
        items.append(PickerModel(id: 1, title: "Kanj", imageString: ""))
        items.append(PickerModel(id: 1, title: "Roy", imageString: ""))
        items.append(PickerModel(id: 1, title: "Nour", imageString: ""))
    }
}

extension ViewController: PickerWithSearchDelegate{
    func pickerWithSearch(_ pickerWithSearch: PickerWithSearchViewController, didSelect item: PickerModel) {
        self.displayLabel.text = item.string()
    }
}
