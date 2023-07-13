//
//  AssignTaskViewController.swift
//  RoomiesApp
//
//  Created by MIGUEL MEXICANO HERRERA on 7/31/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class AssignTaskViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let gradePickerValues = ["Miguel","Ariel","Bruno","Enrique"]
    var roomiesAssign:[String]  = []
    let dayOfWeek = ["L","M","M","J","V","S","D"]
    var selected = [0,0,0,0,0,0,0]
    var gradePicker: UIPickerView?
    @IBOutlet weak var switchOption: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    //var selectedIndexPath: IndexPath?
    //var selected: Bool = false
    
    
    @IBOutlet weak var rommiesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollerctionView(itemSize: 7, interitemSpacing: 0, lineSpacing: 0)
        gradePicker = UIPickerView()
        
        gradePicker?.dataSource = self
        gradePicker?.delegate = self
        
        rommiesTextField.inputView = gradePicker
        rommiesTextField.text = gradePickerValues[0]
        
    }
    

    @IBAction func changeOption(_ sender: UISwitch) {
        if(sender.isOn){
            collectionView.isHidden = true
        }else{
            collectionView.isHidden = false
        }
    }
    
    @IBAction func addRoomie(_ sender: Any) {
        let roomie = rommiesTextField.text!
        
        if(findRommie(roomie: roomie)){
            Utils.showAlert(context: self, title: "Mensaje",message: "No se puede asignar a un compañero dos veces")
        }else{
            roomiesAssign.append(roomie)
            tableView.reloadData()
        }
    }
    
    
    func findRommie(roomie: String)-> Bool{
        for r in roomiesAssign{
            if(roomie == r){
                return true
            }
        }
        return false
    }
    
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupCollerctionView(itemSize: CGFloat,interitemSpacing: CGFloat,lineSpacing: CGFloat){
        //let margin:CGFloat = 1
        let screenWidth = view.bounds.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (screenWidth/itemSize)-8, height: (screenWidth/itemSize)-8)
        layout.minimumInteritemSpacing = interitemSpacing
        layout.minimumLineSpacing = lineSpacing
        collectionView!.collectionViewLayout = layout
        
    }

}

extension AssignTaskViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomiesAssign.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = roomiesAssign[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            roomiesAssign.remove(at: indexPath.row)
            tableView.reloadData()
            break
        default:
            break
        }
    }
    
}


extension AssignTaskViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayOfWeek.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! DaysWeekCollectionViewCell
        cell.dayLabel.text = dayOfWeek[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? DaysWeekCollectionViewCell
        
        if(selected[indexPath.row] == 0){
            selected[indexPath.row] = 1
            cell?.dayView.backgroundColor = UIColor.colorBlue
        }else{
            selected[indexPath.row] = 0
            cell?.dayView.backgroundColor = UIColor.colorRed
        }
        print(selected)
    }
}




extension AssignTaskViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return  gradePickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradePickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        rommiesTextField.text = gradePickerValues[row]
        self.view.endEditing(true)
    }
    
    
}
