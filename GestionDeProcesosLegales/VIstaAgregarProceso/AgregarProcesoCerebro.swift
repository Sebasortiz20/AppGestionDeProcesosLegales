//
//  AgregarProcesoCerebro.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 25/04/23.
//

import Foundation


protocol AgregarProcesoCerebroProtocol {
    func asignarViewController(viewController: AgregarProcesoViewControllerProtocol)
}

class AgregarProcesoCerebro {
    private weak var viewController: AgregarProcesoViewControllerProtocol?
    private let servicioWebDeBusquedaProceso: ServicioWebDeTraerProcesoProtocol = ServicioWebDeTraerProceso()
}

extension AgregarProcesoCerebro: AgregarProcesoCerebroProtocol{
    func asignarViewController(viewController: AgregarProcesoViewControllerProtocol) {
        self.viewController = viewController
    }
}

