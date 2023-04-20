//
//  ComandoEliminarProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 6/04/23.
//

import UIKit

protocol ComandoEliminarProcesoProtocol {
    func eliminarProceso(proceso: ProcesoDominio)
}

class ComandoEliminarProceso {
    let contextoCoreData = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

extension ComandoEliminarProceso: ComandoEliminarProcesoProtocol {
    func eliminarProceso(proceso: ProcesoDominio) {
        print("Eliminando proceso con id: \(proceso.radicado) de la base de datos...")
        let solicitud = DBProceso.fetchRequest() // sebastian hace un papel para la loteria
        solicitud.predicate = NSPredicate(format: "radicado == %@", proceso.radicado) // pone su nombre ahi
        do {
            let dbProcesos = try contextoCoreData.fetch(solicitud)
            
            if dbProcesos.count == 0 {
                print("Error: no existe el proceso con radicado \(proceso.radicado) en la base de datos.")
            } else if dbProcesos.count > 1 {
                print("Error: radicado \(proceso.radicado)")
            }
            // si dbProcesos tiene 0 entradas debe sacar un error, si tiene mas de 1 entrada tambien tiene que sacar un error, si tiene exactamente una entrada la va a eliminar
            let procesoAEliminar = dbProcesos[0]
            contextoCoreData.delete(procesoAEliminar)
            try contextoCoreData.save()
        }
        catch {
            print("Error al eliminar el proceso de la base de datos: \(error)")
        }
        print("Proceso eliminado correctamente.")
    }
}
