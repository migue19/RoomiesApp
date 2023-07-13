//
//  RealmManager.swift
//  NatureSweet
//
//  Created by Antonio Vargas on 03/09/17.
//
//

import Foundation
import RealmSwift


public class RealmManager
{
   static let  realm = try! Realm()

    /**
     Delete local database
    */
    
    static func deleteDatabase()
    {
        do
        {
            try self.realm.write
            {
                self.realm.deleteAll()
            }
        }
        catch
        {
            print("error al borrar la base de batos")
        }
    }
    

    static func saveObjects(objects: [Object])
    {
        try! realm.write
        {
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm.add(objects, update: true)
        }
    }

    
    static func saveObject(object: Object)
    {
		do {
			try realm.write {
				realm.add(object, update: true)
			}
		} catch let error as NSError{
			print("Could not write to database: ", error)
		}
		
    }

    
    static func getObjects(type: Object.Type) -> Results<Object>?
    {
        return realm.objects(type)
    }
	
	
	

    static func getObject(type: Object.Type) -> Object?
    {
        return realm.objects(type).first
    }
    
    
    static func deleteObject(object: Object)
    {
        try! realm.write
        {
            realm.delete(object)
        }
    }
	
	
	static func deleteAllObject(type: Object.Type){
		let objetos = getObjects(type: type)
		
		for obj in objetos!{
			deleteObject(object: obj)
		}
	}
	
	
	
	static func deleteCascade(objeto: Object){
		objeto.objectSchema.properties.forEach({ (property) in
			let name = property.name
			guard let value = objeto.value(forKey: name) else { return }
			guard let entity = value as? Object else{ return }
			deleteCascade(objeto: entity)
		})
		deleteObject(object: objeto)
	}
	
	
}
