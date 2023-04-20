//
//  FormularioEdicionProcesoVista.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

protocol FormularioEdicionProcesoVistaProtocolo where Self: UIView {
    
}

class FormularioEdicionProcesoVista: UIView, FormularioEdicionProcesoVistaProtocolo {
    
    let subvistaAzul: UIView = ConstruirSubvistaAzul.crear()
    let numeroRadicadoTextField = ConstruirTextFieldRadicado.crear()
    let tipoProcesoTextField = ConstruirTextFieldTipoProceso.crear()
    let juezACargoTextField = ConstruirTextFieldJuezACargo.crear()
    let fechaInicioProcesoTextField = ConstruirTextFieldFechaInicioProceso.crear()
    let estadoProcesoTextField = ConstruirTextFieldEstadoProceso.crear()
    let demandadoTextField = ConstruirTextFieldDemandado.crear()
    let idTextField = ConstruirTextFieldId.crear()
    
    private struct Constantes {
        static let margenIzquierdoDelTextField: CGFloat = 30
        static let margenEntreTextFields: CGFloat = 20
        static let numeroRadicadoTextFieldTop: CGFloat = 50
        static let tipoProcesTextFieldTop: CGFloat = 30
        static let fechaInicioProcesoTextFieldTop: CGFloat = 30
        static let idTextFieldTop: CGFloat = 30
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurarVista()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configurarVista() {
        self.backgroundColor = .gray
        configurarSubvistaAzul()
    }
    
    private func configurarSubvistaAzul() {
        addSubview(subvistaAzul)
        subvistaAzul.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subvistaAzul.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            subvistaAzul.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            subvistaAzul.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            subvistaAzul.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        agregarTextFieldsASubvistaAzul()
        ubicarTextFields()
    }
    
    private func agregarTextFieldsASubvistaAzul() {
        subvistaAzul.addSubview(numeroRadicadoTextField)
        subvistaAzul.addSubview(tipoProcesoTextField)
        subvistaAzul.addSubview(estadoProcesoTextField)
        subvistaAzul.addSubview(juezACargoTextField)
        subvistaAzul.addSubview(fechaInicioProcesoTextField)
        subvistaAzul.addSubview(demandadoTextField)
        subvistaAzul.addSubview(idTextField)
    }
    
    private func ubicarTextFields() {
        ubicarTextFieldNumeroRadicado()
        ubicarTextFieldTipoDeProceso()
        ubicarTextFieldEstadoProceso()
        ubicarTextFieldJuezACargo()
        ubicarTextFieldFechaInicioPreceso()
        ubicarTextFieldDemandado()
        ubicarTextFieldId()
    }
    
    private func ubicarTextFieldNumeroRadicado() {
        numeroRadicadoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numeroRadicadoTextField.topAnchor.constraint(equalTo: subvistaAzul.topAnchor, constant: Constantes.numeroRadicadoTextFieldTop),
            numeroRadicadoTextField.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelTextField),
            numeroRadicadoTextField.trailingAnchor.constraint(equalTo: subvistaAzul.trailingAnchor, constant: -Constantes.margenIzquierdoDelTextField)
        ])
    }
    
    private func ubicarTextFieldTipoDeProceso() {
        tipoProcesoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tipoProcesoTextField.topAnchor.constraint(equalTo: numeroRadicadoTextField.bottomAnchor, constant: Constantes.tipoProcesTextFieldTop),
            tipoProcesoTextField.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelTextField),
            tipoProcesoTextField.trailingAnchor.constraint(equalTo: subvistaAzul.trailingAnchor, constant: -Constantes.margenIzquierdoDelTextField)
        ])
    }
    
    private func ubicarTextFieldEstadoProceso() {
        estadoProcesoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            estadoProcesoTextField.topAnchor.constraint(equalTo: tipoProcesoTextField.bottomAnchor, constant: Constantes.margenEntreTextFields),
            estadoProcesoTextField.leadingAnchor.constraint(equalTo: tipoProcesoTextField.leadingAnchor),
            estadoProcesoTextField.trailingAnchor.constraint(equalTo: tipoProcesoTextField.trailingAnchor)
        ])
    }
    
    private func ubicarTextFieldJuezACargo() {
        juezACargoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            juezACargoTextField.topAnchor.constraint(equalTo: estadoProcesoTextField.bottomAnchor, constant: Constantes.margenEntreTextFields),
            juezACargoTextField.leadingAnchor.constraint(equalTo: estadoProcesoTextField.leadingAnchor),
            juezACargoTextField.trailingAnchor.constraint(equalTo: estadoProcesoTextField.trailingAnchor)
        ])
    }
    
    private func ubicarTextFieldFechaInicioPreceso() {
        fechaInicioProcesoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fechaInicioProcesoTextField.topAnchor.constraint(equalTo: juezACargoTextField.bottomAnchor, constant: Constantes.fechaInicioProcesoTextFieldTop),
            fechaInicioProcesoTextField.leadingAnchor.constraint(equalTo: juezACargoTextField.leadingAnchor),
            fechaInicioProcesoTextField.trailingAnchor.constraint(equalTo: juezACargoTextField.trailingAnchor)
        ])
    }
    
    private func ubicarTextFieldDemandado() {
        demandadoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            demandadoTextField.topAnchor.constraint(equalTo: fechaInicioProcesoTextField.bottomAnchor, constant: Constantes.margenEntreTextFields),
            demandadoTextField.leadingAnchor.constraint(equalTo: juezACargoTextField.leadingAnchor),
            demandadoTextField.trailingAnchor.constraint(equalTo: juezACargoTextField.trailingAnchor)
        ])
    }
    
    private func ubicarTextFieldId() {
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: demandadoTextField.bottomAnchor, constant: Constantes.idTextFieldTop),
            idTextField.leadingAnchor.constraint(equalTo: juezACargoTextField.leadingAnchor),
            idTextField.trailingAnchor.constraint(equalTo: juezACargoTextField.trailingAnchor)
        ])
    }
}
