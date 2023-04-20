//
//  FormularioEdicionProcesoViewController.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

protocol FormularioEdicionProcesoViewControllerProtocol: AnyObject {
    func configurarParaEditarProceso(_ proceso: ProcesoDominio)
}

class FormularioEdicionProcesoViewController: UIViewController {
    
    var finalizarEdicion: ((ProcesoDominio) -> Void)?
    private let cerebro: FormularioEdicionProcesoCerebroProtocol
    private let vista = FormularioEdicionProcesoVista()
    
    init(cerebro: FormularioEdicionProcesoCerebroProtocol) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = FormularioEdicionProcesoVistaConstructor.construya()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cerebro.asignarViewController(viewController: self)
        view.addSubview(vista)
        
        let guardarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(guardar))
        navigationItem.rightBarButtonItem = guardarButton
        
        let cancelarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelar))
        navigationItem.leftBarButtonItem = cancelarButton
    }
    
    @objc private func guardar() {
        guard let numeroRadicado = vista.numeroRadicadoTextField.text,
              let tipoProceso = vista.tipoProcesoTextField.text,
              let estadoProceso = vista.estadoProcesoTextField.text,
              let juezACargo = vista.juezACargoTextField.text,
              let fechaInicioProceso = vista.fechaInicioProcesoTextField.text,
              let demandado = vista.demandadoTextField.text,
              let id = vista.idTextField.text else {
            let alerta = UIAlertController(title: "Error", message: "Todos los campos son requeridos.", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
            return
        }
        
        let procesoModificado = ProcesoDominio(id: id, tipoDeProceso: tipoProceso, estadoDelProceso: estadoProceso, juezACargo: juezACargo, fechaInicioProceso: fechaInicioProceso, demandado: demandado, radicado: numeroRadicado)
        
        let comandoActualizarProceso = ComandoActualizarProceso()
        comandoActualizarProceso.actualizarProceso(proceso: procesoModificado)
        finalizarEdicion?(procesoModificado)
    }
    
    @objc private func cancelar() {
        dismiss(animated: true, completion: nil)
    }
}

extension FormularioEdicionProcesoViewController: FormularioEdicionProcesoViewControllerProtocol {
    func configurarParaEditarProceso(_ proceso: ProcesoDominio) {
        vista.numeroRadicadoTextField.text = proceso.radicado
        vista.tipoProcesoTextField.text = proceso.tipoDeProceso
        vista.estadoProcesoTextField.text = proceso.estadoDelProceso
        vista.juezACargoTextField.text = proceso.juezACargo
        vista.fechaInicioProcesoTextField.text = proceso.fechaInicioProceso
        vista.demandadoTextField.text = proceso.demandado
        vista.idTextField.text = proceso.id
    }
}


