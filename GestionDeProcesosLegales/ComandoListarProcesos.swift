//
//  ComandoListarProcesos.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 6/04/23.
//

import UIKit

protocol ComandoListarProcesosProtocol {
    func listarProcesos() -> [ProcesoDominio]
}

class ComandoListarProcesos {
    
    let contextoCoreData = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

extension ComandoListarProcesos: ComandoListarProcesosProtocol {
    func listarProcesos() -> [ProcesoDominio] {
        do {
            let dbProcesos = try contextoCoreData.fetch(DBProceso.fetchRequest())
            let procesosDominio = MapaDBProcesoAProcesoDominio.convertir(dbProcesos)
            return procesosDominio
        } catch {
            print("Error al obtener los procesos de la base de datos: \(error.localizedDescription)")
            return []
        }
    }
}

