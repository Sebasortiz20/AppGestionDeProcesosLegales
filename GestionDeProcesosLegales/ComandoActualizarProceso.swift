//
//  ComandoActualizarProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 6/04/23.
//

import UIKit

protocol ComandoActualizarProcesoProtocol {
    func actualizarProceso(proceso: ProcesoDominio)
}

class ComandoActualizarProceso {
    let contextoCoreData = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

extension ComandoActualizarProceso: ComandoActualizarProcesoProtocol {
    func actualizarProceso(proceso: ProcesoDominio) {
        print("Actualizando proceso con id: \(proceso.id) en la base de datos...")
        let request = DBProceso.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", proceso.id)
        do {
            let dbProceso = try contextoCoreData.fetch(request)
            if dbProceso.count == 0 {
                print("Error: no existe el proceso con id \(proceso.id) en la base de datos.")
            } else if dbProceso.count > 1 {
                print("Error: existen múltiples procesos con el mismo id \(proceso.id)")
            } else {
                let procesoAActualizar = dbProceso[0]
                procesoAActualizar.radicado = proceso.radicado
                procesoAActualizar.tipoDeProceso = proceso.tipoDeProceso
                procesoAActualizar.estadoDelProceso = proceso.estadoDelProceso
                procesoAActualizar.juezACargo = proceso.juezACargo
                procesoAActualizar.fechaInicioProceso = proceso.fechaInicioProceso
                procesoAActualizar.demandado = proceso.demandado
                try contextoCoreData.save()
            }
        } catch {
            print("Error al actualizar el proceso en la base de datos: \(error)")
        }
        print("Proceso actualizado correctamente.")
    }
}
