//
//  ListadoDeProcesosCerebro.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 29/03/23.
//

import Foundation

protocol ListadoDeProcesosCerebroProtocol {
    func asiganarVC(viewController: ListadoDeProcesosViewControllerProtocol)
    func asignarListadoDeProcesosVista(_ listadoDeProcesosVista: ListadoDeProcesosVistaProtocol)
    func obtenerNumeroDeProcesos() -> Int
    func obtenerProceso(de index: Int) -> ProcesoDominio
    func asignarProcesos(_ procesos: [ProcesoDominio])
    func obtenerProcesos() -> [ProcesoDominio]
    func agregarProceso(_ proceso: ProcesoDominio)
    func eliminarProceso(en indice: Int)
    func actualizarProceso(proceso: ProcesoDominio, en indice: Int)
}

class ListadoDeProcesosCerebro {
    
    private weak var miViewController: ListadoDeProcesosViewControllerProtocol?
    private weak var listadoDeProcesosVista: ListadoDeProcesosVistaProtocol?
    private var procesos = [ProcesoDominio]()
}

extension ListadoDeProcesosCerebro: ListadoDeProcesosCerebroProtocol {
    func actualizarProceso(proceso: ProcesoDominio, en indice: Int) {
        procesos[indice] = proceso
    }
    
    func eliminarProceso(en indice: Int) {
        procesos.remove(at: indice)
    }
    
    func agregarProceso(_ proceso: ProcesoDominio) {
        procesos.append(proceso)
    }
    
    func obtenerProcesos() -> [ProcesoDominio] {
        return procesos
    }
    
    func asignarProcesos(_ procesos: [ProcesoDominio]) {
        self.procesos = procesos
    }
    
    func obtenerProceso(de index: Int) -> ProcesoDominio {
        return procesos[index]
    }
    
    func asignarListadoDeProcesosVista(_ listadoDeProcesosVista: ListadoDeProcesosVistaProtocol) {
        self .listadoDeProcesosVista = listadoDeProcesosVista
    }
    
    func obtenerNumeroDeProcesos() -> Int {
        return procesos.count
    }
    
    func asiganarVC(viewController: ListadoDeProcesosViewControllerProtocol) {
        miViewController = viewController
    }
}
