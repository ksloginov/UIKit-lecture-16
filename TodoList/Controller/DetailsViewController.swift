//
//  DetailsViewController.swift
//  TodoList
//
//  Created by Konstantin Loginov on 30.09.2021.
//

import UIKit

class DetailsViewController: UIViewController,  {
    @IBOutlet weak var detailsLabel: UILabel!
    
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = todo?.label
    }

}
