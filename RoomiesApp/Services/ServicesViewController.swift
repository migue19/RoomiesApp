//
//  ServicesViewController.swift
//  RoomiesApp
//
//  Created by MIGUEL MEXICANO HERRERA on 7/31/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let services:[ServicesModel] = [ServicesModel(monto: 25.22, nameService: "Agua")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    


}


extension ServicesViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ServiceTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! ServiceTableViewCell
        
        cell.serviceTitle.text = services[indexPath.row].nameService
        let monto = String(format:"%.2f", services[indexPath.row].monto ?? 0)
        cell.amount.text = "$ \(monto)"
        
        return cell
        
    }
}
