//
//  DetallesCerebro.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import Foundation

protocol DetallesCerebroProtocolo {
    func asiganarVC(viewController: DetallesVistaControladorProtocolo)
    func procesarViewDidLoad()
    func asignarRadicado(_ radicado: String)
}

class DetallesCerebro {
    private weak var miViewController: DetallesVistaControladorProtocolo?
    private let servicioWebDeBusquedaProceso: ServicioWebDeTraerProcesoProtocol = ServicioWebDeTraerProceso()
    private var procesosDominio: [ProcesoDominio] = []
    private var numeroRadicado: String = ""
}

extension DetallesCerebro: DetallesCerebroProtocolo {
    func asiganarVC(viewController: DetallesVistaControladorProtocolo) {
        miViewController = viewController
    }
    
    func procesarViewDidLoad() {
        servicioWebDeBusquedaProceso.asignarRadicado(numeroRadicado: self.numeroRadicado)
        servicioWebDeBusquedaProceso.obtenerProcesos { [weak self] procesosDominio in
            guard let self = self else { return }
            self.procesosDominio = procesosDominio
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
    
    func asignarRadicado(_ radicado: String) {
        self.numeroRadicado = radicado
    }
}
