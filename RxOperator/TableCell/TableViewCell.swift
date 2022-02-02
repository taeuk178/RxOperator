//
//  TableViewCell.swift
//  RxOperator
//
//  Created by tw on 2022/01/29.
//

import UIKit
import RxSwift
import SystemConfiguration

class TableViewCell: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var isExpandable: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
    }
    
}

extension TableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ButtonCell else { return UITableViewCell() }
            
        
//        cell.closureCell = { [unowned self] in
//            print(cell.isExpandable)
//            self.tableView.reloadData()
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }

}
