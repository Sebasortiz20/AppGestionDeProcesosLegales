//
//  HomeCerebro.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import Foundation

protocol HomeCerebroProtocolo {
    func asiganarVC(viewController: HomeVistaControladorProtocolo)
    func procesarToqueBotonConsultar()
}

class HomeCerebro {
    private weak var miViewController: HomeVistaControladorProtocolo?
    private let servicioWebDeBusquedaProceso: ServicioWebDeTraerProcesoProtocol = ServicioWebDeTraerProceso()
    private var numeroRadicacion: String?
}

extension HomeCerebro: HomeCerebroProtocolo {
    func asiganarVC(viewController: HomeVistaControladorProtocolo) {
        self.miViewController = viewController
    }
    
    func procesarToqueBotonConsultar() {
        guard let miViewController = miViewController else {
            return
        }
        miViewController.navegarHaciaVistaDetalle()
    }
}

