//
//  AgregarProcesoViewController.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 25/04/23.
//

import UIKit

protocol AgregarProcesoViewControllerProtocol: AnyObject {
    
}

class AgregarProcesoViewController: UIViewController  {
    
    private let cerebro: AgregarProcesoCerebroProtocol
    private let vista = AgregarProcesoVista()
    
    init(cerebro: AgregarProcesoCerebroProtocol) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = AgregarProcesoVistaConstructor.construya()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cerebro.asignarViewController(viewController: self)
        view.addSubview(vista)
        
        let guardarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(agregar))
        navigationItem.rightBarButtonItem = guardarButton
        
        let cancelarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelar))
        navigationItem.leftBarButtonItem = cancelarButton
    }
    
    @objc private func agregar() {
        guard let numeroRadicado = vista.numeroRadicadoTextField.text,
              let tipoProceso = vista.tipoProcesoTextField.text,
              let estadoProceso = vista.estadoProcesoTextField.text,
              let juezACargo = vista.juezACargoTextField.text,
              let fechaInicioProceso = vista.fechaInicioProcesoTextField.text,
              let demandado = vista.demandadoTextField.text,
              let id = vista.idTextField.text else {
            return
        }
        
        if numeroRadicado.isEmpty ||
            tipoProceso.isEmpty ||
            estadoProceso.isEmpty ||
            juezACargo.isEmpty ||
            fechaInicioProceso.isEmpty ||
            demandado.isEmpty ||
            id.isEmpty
        {
            let alerta = UIAlertController(title: "Error", message: "Todos los campos son requeridos.", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
            return
        }
        
        let procesoModificado = ProcesoDominio(id: id, tipoDeProceso: tipoProceso, estadoDelProceso: estadoProceso, juezACargo: juezACargo, fechaInicioProceso: fechaInicioProceso, demandado: demandado, radicado: numeroRadicado)
        
        let comandoActualizarProceso = ComandoActualizarProceso()
        comandoActualizarProceso.actualizarProceso(proceso: procesoModificado)
    }
    
    @objc private func cancelar() {
        navigationController?.popViewController(animated: true)
    }
}

extension AgregarProcesoViewController: AgregarProcesoViewControllerProtocol {
   
}
