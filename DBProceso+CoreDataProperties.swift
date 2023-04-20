//
//  DBProceso+CoreDataProperties.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 29/03/23.
//
//

import Foundation
import CoreData


extension DBProceso {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBProceso> {
        return NSFetchRequest<DBProceso>(entityName: "DBProceso")
    }

    @NSManaged public var demandado: String?
    @NSManaged public var estadoDelProceso: String?
    @NSManaged public var fechaInicioProceso: String?
    @NSManaged public var juezACargo: String?
    @NSManaged public var radicado: String?
    @NSManaged public var tipoDeProceso: String?
    @NSManaged public var id: String?

}

extension DBProceso : Identifiable {

}
