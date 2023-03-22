//
//  DetallesVistaControlador.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol DetallesVistaControladorProtocolo: AnyObject {
    
}

class DetallesVistaControlador: UIViewController {

    let cerebro: DetallesCerebroProtocolo
    init(cerebro: DetallesCerebroProtocolo) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = DetallesVistaConstructor.construya()
    }
}

extension DetallesVistaControlador: DetallesVistaControladorProtocolo {
    
}
