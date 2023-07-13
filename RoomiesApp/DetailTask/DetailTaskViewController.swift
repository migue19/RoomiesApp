//
//  DetailTaskViewController.swift
//  RoomiesApp
//
//  Created by MIGUEL MEXICANO HERRERA on 7/31/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let section = ["Actividades", "Servicios"]
    
    let items = [["Lavar Trastes"], ["Agua", "Luz", "Internet"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension DetailTaskViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        return cell
    }
    
    
    
    
}
