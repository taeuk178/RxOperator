//
//  ListViewController.swift
//  RxOperator
//
//  Created by tw on 2022/01/30.
//

import UIKit

struct medicModel: Codable {
    var date = 20220127
    var hospitalName = ""
    var myprice = 0
    var gongprice = 0
}


class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [[medicModel]] = [[], [], []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...10 {
            var makeMedic = medicModel()
            makeMedic.date = 20220120 + (i % 3)
            makeMedic.hospitalName = i % 2 == 0 ? "캐시내과" : "사거리약국"
            makeMedic.myprice = i * 50
            makeMedic.gongprice = i * 100
            
            if makeMedic.date == 20220120 {
                sections[0].append(makeMedic)
            } else if makeMedic.date == 20220121 {
                sections[1].append(makeMedic)
            } else if makeMedic.date == 20220122 {
                sections[2].append(makeMedic)
            }
        }
        
        print(sections[0])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section][0].date)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = sections[indexPath.section][indexPath.row].hospitalName
        return cell
    }
}
