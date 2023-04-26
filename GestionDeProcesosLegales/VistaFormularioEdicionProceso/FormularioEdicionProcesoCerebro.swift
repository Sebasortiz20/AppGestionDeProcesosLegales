//
//  FormularioEdicionProcesoCerebro.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import Foundation

protocol FormularioEdicionProcesoCerebroProtocol {
    func asignarViewController(viewController: FormularioEdicionProcesoViewControllerProtocol)
    func configurarProcesoEnVista(_ proceso: ProcesoDominio)
}

class FormularioEdicionProcesoCerebro {
    private var proceso: ProcesoDominio?
    private weak var viewController: FormularioEdicionProcesoViewControllerProtocol?
    private let servicioWebDeBusquedaProceso: ServicioWebDeTraerProcesoProtocol = ServicioWebDeTraerProceso()
    var finalizarEdicion: ((ProcesoDominio) -> Void)?
}

extension FormularioEdicionProcesoCerebro: FormularioEdicionProcesoCerebroProtocol{
    func asignarViewController(viewController: FormularioEdicionProcesoViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func configurarProcesoEnVista(_ proceso: ProcesoDominio) {
        guard let viewController = viewController else {
            return
        }
        viewController.configurarParaEditarProceso(proceso)
    }
}
