//
//  MapaAPIProcesoAProcesoDominio.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 24/04/23.
//

import Foundation

class MapaAPIProcesoAProcesoDominio {
    static func convertir(_ respuestaConsultaAPIProcesos: [RespuestaConsultaAPIProcesos]) -> [ProcesoDominio] {
        return respuestaConsultaAPIProcesos.flatMap { respuesta in
            return respuesta.apiProcesos.map { apiProceso in
                return ProcesoDominio(
                    id: String(apiProceso.idProceso),
                    tipoDeProceso: apiProceso.esPrivado ? "true" : "false",
                    estadoDelProceso: apiProceso.soloActivos ? "true" : "false",
                    juezACargo: apiProceso.despacho,
                    fechaInicioProceso: apiProceso.fechaProceso,
                    demandado: apiProceso.sujetosProcesales,
                    radicado: String(apiProceso.llaveProceso))
            }
        }
    }
}

