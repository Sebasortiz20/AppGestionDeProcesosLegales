//
//  EstructurasDeAPI.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 24/04/23.
//

import Foundation

struct APIProceso: Decodable {                
    let idProceso: Int      /// id
    let llaveProceso: Int   /// radicado
    let fechaProceso: String /// fechaInicioProceso
    let sujetosProcesales: String /// demandado
    let despacho: String /// juez a cargo
    let esPrivado: Bool /// tipoDeProceso
    let soloActivos: Bool /// estadoDelProceso
}

struct RespuestaConsultaAPIProcesos: Decodable {
    let tipoConsulta: String
    let apiProcesos: [APIProceso]
}
