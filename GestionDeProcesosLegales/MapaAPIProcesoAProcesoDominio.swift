//
//  MapaAPIProcesoAProcesoDominio.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 24/04/23.
//

import Foundation

class MapaAPIProcesoAProcesoDominio {
    static func convertir(_ respuestaConsultaAPIProcesos: Radicado) -> [ProcesoDominio] {
        return respuestaConsultaAPIProcesos.procesos.compactMap { proceso in
            return ProcesoDominio(
                id: String(proceso.idProceso),
                tipoDeProceso: proceso.esPrivado ? "true" : "false",
                estadoDelProceso: respuestaConsultaAPIProcesos.parametros.soloActivos ? "true" : "false",
                juezACargo: proceso.despacho,
                fechaInicioProceso: proceso.fechaProceso,
                demandado: proceso.sujetosProcesales,
                radicado: String(respuestaConsultaAPIProcesos.parametros.numero))
        }
    }
}
