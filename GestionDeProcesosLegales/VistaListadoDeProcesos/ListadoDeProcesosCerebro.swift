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
    func procesarViewDidLoad()
}

class ListadoDeProcesosCerebro {
    private weak var miViewController: ListadoDeProcesosViewControllerProtocol?
    private weak var listadoDeProcesosVista: ListadoDeProcesosVistaProtocol?
    private let servicioWebDeBusquedaProceso: ServicioWebDeTraerProcesoProtocol = ServicioWebDeTraerProceso()
    private var procesosDominio: [ProcesoDominio] = []
}

extension ListadoDeProcesosCerebro: ListadoDeProcesosCerebroProtocol {
    func procesarViewDidLoad() {
        servicioWebDeBusquedaProceso.obtenerProcesos { [weak self] procesosDominio in
            guard let self = self else { return }
            self.procesosDominio = procesosDominio
            self.listadoDeProcesosVista?.actualizarTabla()
        } casoError: { [weak self] error in
            guard let self = self else { return }
                let mensaje = self.obtenerMensajeDe(error: error)
                self.miViewController?.PresentarError(con: mensaje)
        }
    }
    
    func obtenerMensajeDe(error: ErrorDeServicioWeb) -> String {
        switch error {
        case.noSePudoHacerLaPeticion:
            return "Tenemos problemas de red"
        case.datosNulosInesperados, .errorDeDescodificación, .códigoDeEstadoInesperado:
            return "Obtuvimos una respuesta inesperada de parte del servidor"
        }
    }
    
    func actualizarProceso(proceso: ProcesoDominio, en indice: Int) {
        procesosDominio[indice] = proceso
    }
    
    func eliminarProceso(en indice: Int) {
        procesosDominio.remove(at: indice)
    }
    
    func agregarProceso(_ proceso: ProcesoDominio) {
        procesosDominio.append(proceso)
    }
    
    func obtenerProcesos() -> [ProcesoDominio] {
        return procesosDominio
    }
    
    func asignarProcesos(_ procesos: [ProcesoDominio]) {
        self.procesosDominio = procesos
    }
    
    func obtenerProceso(de index: Int) -> ProcesoDominio { /// get post For index 
        return procesosDominio[index]
    }
    
    func asignarListadoDeProcesosVista(_ listadoDeProcesosVista: ListadoDeProcesosVistaProtocol) {
        self .listadoDeProcesosVista = listadoDeProcesosVista
    }
    
    func obtenerNumeroDeProcesos() -> Int {
        return procesosDominio.count
    }
    
    func asiganarVC(viewController: ListadoDeProcesosViewControllerProtocol) {
        miViewController = viewController
    }
}
