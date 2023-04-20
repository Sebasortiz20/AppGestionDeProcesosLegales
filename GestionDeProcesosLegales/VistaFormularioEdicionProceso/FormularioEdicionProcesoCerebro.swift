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
    private weak var ViewController: FormularioEdicionProcesoViewControllerProtocol?
    var finalizarEdicion: ((ProcesoDominio) -> Void)?
}

extension FormularioEdicionProcesoCerebro: FormularioEdicionProcesoCerebroProtocol{
    
    
    func asignarViewController(viewController: FormularioEdicionProcesoViewControllerProtocol) {
        ViewController = viewController
    }
    func configurarProcesoEnVista(_ proceso: ProcesoDominio) {
        guard let viewController = ViewController else {
            return
        }
        viewController.configurarParaEditarProceso(proceso)
    }
}
