//
//  DetallesVista.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol DetallesVistaProtocolo where Self: UIView {
    
}

class DetallesVista: UIView, DetallesVistaProtocolo {
    
    private struct Constantes {
        static let margenIzquierdoDelLabel: CGFloat = 20
        static let margenEntreLabels: CGFloat = 30
        static let numeroRadicadoLabelTop: CGFloat = 140
        static let tipoProcesoLabelTop: CGFloat = 80
    }
    
    private let subvistaAzul: UIView = ConstruirSubvistaColorAzul.crear()
    private let numeroRadicadoLabel: UILabel = ConstruirLabelNumeroRadicado.crear()
    private let tipoProcesoLabel: UILabel = ConstruirLabelTipoProceso.crear()
    private let estadoProcesoLabel: UILabel = ConstruirLabelEstadoProceso.crear()
    private let juezACargoLabel: UILabel = ConstruirLabelJuezACargo.crear()
    private let fechaInicioProcesoLabel: UILabel = ConstruirLabelFechaInicioProceso.crear()
    private let demandadoLabel: UILabel = ConstruirLabelDemandado.crear()
    
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
        agregarLabelsASubvistaAzul()
        ubicarLabels()
    }
    
    private func agregarLabelsASubvistaAzul() {
        subvistaAzul.addSubview(numeroRadicadoLabel)
        subvistaAzul.addSubview(tipoProcesoLabel)
        subvistaAzul.addSubview(estadoProcesoLabel)
        subvistaAzul.addSubview(juezACargoLabel)
        subvistaAzul.addSubview(fechaInicioProcesoLabel)
        subvistaAzul.addSubview(demandadoLabel)
    }
    
    private func ubicarLabels() {
        ubicarLabelNumeroRadicado()
        ubicarLabelTipoDeProceso()
        ubicarLabelEstadoProceso()
        ubicarLabelJuezACargo()
        ubicarLabelFechaInicioPreceso()
        ubicarLabelDemandado()
    }
    
    private func ubicarLabelNumeroRadicado() {
        numeroRadicadoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numeroRadicadoLabel.topAnchor.constraint(equalTo: subvistaAzul.topAnchor, constant:  Constantes.numeroRadicadoLabelTop),
            numeroRadicadoLabel.centerXAnchor.constraint(equalTo: subvistaAzul.centerXAnchor)
        ])
    }
    
    private func ubicarLabelTipoDeProceso() {
        tipoProcesoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tipoProcesoLabel.topAnchor.constraint(equalTo: numeroRadicadoLabel.bottomAnchor, constant: Constantes.tipoProcesoLabelTop),
            tipoProcesoLabel.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelLabel)
        ])
    }
    
    private func ubicarLabelEstadoProceso() {
        estadoProcesoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            estadoProcesoLabel.topAnchor.constraint(equalTo: tipoProcesoLabel.bottomAnchor, constant: Constantes.margenEntreLabels),
            estadoProcesoLabel.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelLabel)
        ])
    }
    
    private func ubicarLabelJuezACargo() {
        juezACargoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            juezACargoLabel.topAnchor.constraint(equalTo: estadoProcesoLabel.bottomAnchor, constant: Constantes.margenEntreLabels),
            juezACargoLabel.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelLabel)
        ])
    }
    
    private func ubicarLabelFechaInicioPreceso() {
        fechaInicioProcesoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fechaInicioProcesoLabel.topAnchor.constraint(equalTo: juezACargoLabel.bottomAnchor, constant: Constantes.margenEntreLabels),
            fechaInicioProcesoLabel.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelLabel)
        ])
    }
    
    private func ubicarLabelDemandado() {
        demandadoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            demandadoLabel.topAnchor.constraint(equalTo: fechaInicioProcesoLabel.bottomAnchor, constant: Constantes.margenEntreLabels),
            demandadoLabel.leadingAnchor.constraint(equalTo: subvistaAzul.leadingAnchor, constant: Constantes.margenIzquierdoDelLabel)
        ])
    }
}
