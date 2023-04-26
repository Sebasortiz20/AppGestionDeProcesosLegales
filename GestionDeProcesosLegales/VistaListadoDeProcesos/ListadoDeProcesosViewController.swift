//
//  ListadoDeProcesosViewController.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 29/03/23.
//

import UIKit

protocol ListadoDeProcesosViewControllerProtocol: AnyObject {
    func navegarHaciaVistaFormularioEdicionProceso()
    func PresentarError(con mensaje: String)
    func navegarHaciaVistaAgregarProceso()
}

class ListadoDeProcesosViewController: UIViewController {
    
    private let cerebro: ListadoDeProcesosCerebroProtocol
    private let vista = ListadoDeProcesosVista()
    
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
        cerebro.procesarViewDidLoad()
    }
}

extension ListadoDeProcesosViewController: JefeListadoDeProcesosVista {
    func procesarToqueBotonEditar() {
        navegarHaciaVistaFormularioEdicionProceso()
    }
    
    func procesarToqueBotonActualizar() {
    }
    
    func procesarToqueBotonAgregar() {
        navegarHaciaVistaAgregarProceso()
    }
}

extension ListadoDeProcesosViewController: ListadoDeProcesosViewControllerProtocol {
    func navegarHaciaVistaAgregarProceso() {
        let vc = AgregarProcesoConstructor.construya()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func PresentarError(con mensaje: String) {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
        let accionOk = UIAlertAction(title: "OK", style: .default)
        alerta.addAction(accionOk)
        present(alerta, animated: true)
    }
    
    func navegarHaciaVistaFormularioEdicionProceso() {
        let vc = FormularioEdicionProcesoConstructor.construya()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
