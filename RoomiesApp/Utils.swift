//
//  Utils.swift
//  RoomiesApp
//
//  Created by MIGUEL MEXICANO HERRERA on 8/2/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import Foundation
import  UIKit

class Utils {
    
    
    static func showAlert(context: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                break
            case .cancel:
                print("cancel")
                break
            case .destructive:
                print("destructive")
                break
            default:
                break
            }}))
        
        context.present(alert, animated: true, completion: nil)
        
    }

}
