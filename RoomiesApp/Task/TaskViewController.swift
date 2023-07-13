//
//  TaskViewController.swift
//  RoomiesApp
//
//  Created by MIGUEL MEXICANO HERRERA on 7/31/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let task = ["Lavar Trastes","Limpiar Baño","Limpiar Sala"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Actividades"

        // Do any additional setup after loading the view.
    }
}


extension TaskViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TaskTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TaskTableViewCell
        
        cell.nameTask.text = task[indexPath.row]
        
        
        return cell

    }
    
    
    
    
}
