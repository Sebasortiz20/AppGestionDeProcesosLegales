//
//  ListadoDeProcesosViewController.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 29/03/23.
//

import UIKit

protocol ListadoDeProcesosViewControllerProtocol: AnyObject {
    func botonAgregarPresionado()
    func botonActualizarPresionado()
}

class ListadoDeProcesosViewController: UIViewController {
    
    private let cerebro: ListadoDeProcesosCerebroProtocol
    
    init(cerebro: ListadoDeProcesosCerebroProtocol) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        let listadoDeProcesosVista = ListadoDeProcesosVistaConstructor.construya()
        listadoDeProcesosVista.asignarJefe(self)
        self.view = listadoDeProcesosVista
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cerebro.asiganarVC(viewController: self)  /// cerebroListado su viewController soy yo
    }
}

extension ListadoDeProcesosViewController: JefeListadoDeProcesosVista {
    func procesarToqueBotonActualizar() {
        botonActualizarPresionado()
    }
    
    func procesarToqueBotonAgregar() {
        botonAgregarPresionado()
    }
}

extension ListadoDeProcesosViewController: ListadoDeProcesosViewControllerProtocol {
    func botonActualizarPresionado() {
        print("Actualizar")
    }
    
    func botonAgregarPresionado() {}
}
