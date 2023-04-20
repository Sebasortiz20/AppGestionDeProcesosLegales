//
//  ComandoAgregarProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 6/04/23.
//

import UIKit

protocol ComandoAgregarProcesoProtocol {
    func agregarProceso(_ proceso: ProcesoDominio)
}

class ComandoAgregarProceso {
    let contextoCoreData = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

extension ComandoAgregarProceso: ComandoAgregarProcesoProtocol {
    func agregarProceso(_ proceso: ProcesoDominio) {
        let nuevoDBProceso = DBProceso(context: contextoCoreData)
        nuevoDBProceso.radicado = proceso.radicado
        nuevoDBProceso.id = proceso.id
        do {
            try contextoCoreData.save()
        } catch {
            print("Error al agregar el proceso a la base de datos: \(error.localizedDescription)")
        }
    }
}
