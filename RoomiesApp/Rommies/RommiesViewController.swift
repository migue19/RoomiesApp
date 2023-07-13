//
//  RommiesViewController.swift
//  RoomiesApp
//
//  Created by Miguel Mexicano on 7/31/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class RommiesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let roomies = ["Miguel","Ariel","Bruno","Enrique"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollerctionView(itemSize: 3.0,interitemSpacing: 2.0, lineSpacing: 2.0)
        //self.navigationItem.title = "Compañeros"

        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func sumarNumeros(n: Int)-> Int{
        return n*(n+1)/2
    }
    
    func setupCollerctionView(itemSize: CGFloat,interitemSpacing: CGFloat,lineSpacing: CGFloat){
        let margin:CGFloat = 10
        let screenWidth = view.bounds.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: margin, bottom: 10, right: margin)
        layout.itemSize = CGSize(width: (screenWidth/itemSize)-interitemSpacing-(margin-interitemSpacing), height: (screenWidth/itemSize)-interitemSpacing-10)
        layout.minimumInteritemSpacing = interitemSpacing
        layout.minimumLineSpacing = lineSpacing
        collectionView!.collectionViewLayout = layout
    }
    
}


extension RommiesViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! RommiesCollectionViewCell
        cell.nameCell.text = roomies[indexPath.row]
        //cell.backgroundColor = UIColor.cyan
        
        return cell
    }
    
    
   
    
    
    
}
