//
//  DetallesCerebro.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import Foundation

protocol DetallesCerebroProtocolo {
    func asiganarVC(viewController: DetallesVistaControladorProtocolo)
}

class DetallesCerebro {
    private weak var miViewController: DetallesVistaControladorProtocolo?
}

extension DetallesCerebro: DetallesCerebroProtocolo {
    func asiganarVC(viewController: DetallesVistaControladorProtocolo) {
        miViewController = viewController
    }
    
    
}
