//
//  MapaDBProcesoAProcesoDominio.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 12/04/23.
//

import Foundation

class MapaDBProcesoAProcesoDominio {
    static func convertir(_ dbProceso: DBProceso) -> ProcesoDominio {
        return ProcesoDominio(id: dbProceso.id ?? " ",
                              tipoDeProceso: dbProceso.tipoDeProceso ?? " ",
                              estadoDelProceso: dbProceso.estadoDelProceso ?? " ",
                              juezACargo: dbProceso.juezACargo ?? " ",
                              fechaInicioProceso: dbProceso.fechaInicioProceso ?? " ",
                              demandado: dbProceso.demandado ?? " ",
                              radicado: dbProceso.radicado ?? " ")
    }
    
    static func convertir(_ dbProcesos: [DBProceso]) -> [ProcesoDominio] {
        var procesosDominio = [ProcesoDominio]()
        for dbProceso in dbProcesos {
            procesosDominio.append(convertir(dbProceso))
        }
        return procesosDominio
    }
}
