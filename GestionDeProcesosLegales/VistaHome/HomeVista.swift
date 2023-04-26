//
//  HomeVista.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol JefeHomeVista: AnyObject {
    func procesarToqueBotonConsultar()
}

protocol HomeVistaProtocolo where Self: UIView {
    func asignarJefe(_ jefe: JefeHomeVista)
}

class HomeVista: UIView, JefeHomeBotonConsultar {
    
    private weak var miJefe: JefeHomeVista?
    
    private struct Constantes {
        static let espacioSuperior: CGFloat = 40
        static let espacioInferior: CGFloat = 100
        static let margenIzquierdo: CGFloat = 20
        static let margenDerecho: CGFloat = -20
    }
    
    private let mainStackView = HomeStackView()
    private let botonConsultar = HomeBotonConsultar()
    private let campoDeTextoRadicado = HomeCampoDeTexto()
    private let labelConsultarProceso = HomeLabelConsultarProceso()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        agregarColorDeFondoAlView()
        agregarSubvistas()
        agregarConstraints()
        botonConsultar.asignarJefe(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func agregarColorDeFondoAlView() {
        backgroundColor =  .gray
    }
    
    private func agregarSubvistas() {
        self.addSubview(mainStackView)
        mainStackView.addArrangedSubview(labelConsultarProceso)
        mainStackView.addArrangedSubview(campoDeTextoRadicado)
        mainStackView.addArrangedSubview(botonConsultar)
        mainStackView.addArrangedSubview(UIView())              // espacio
    }
    
    private func agregarConstraints() {
        agregarConstraintsStackView()
        agregarConstraintsLabel()
        agregarConstraintsCampoDeTexto()
        agregarConstraintsBoton()
    }
    
    private func agregarConstraintsStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.safeAreaLayoutGuide.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            self.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
        ])
    }
    
    private func agregarConstraintsLabel() {
        labelConsultarProceso.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelConsultarProceso.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: Constantes.espacioSuperior),
            labelConsultarProceso.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            labelConsultarProceso.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            labelConsultarProceso.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        ])
    }
    
    private func agregarConstraintsCampoDeTexto() {
        campoDeTextoRadicado.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            campoDeTextoRadicado.topAnchor.constraint(equalTo: labelConsultarProceso.bottomAnchor,constant: Constantes.espacioInferior),
            campoDeTextoRadicado.leftAnchor.constraint(equalTo: mainStackView.leftAnchor, constant: Constantes.margenIzquierdo),
            campoDeTextoRadicado.rightAnchor.constraint(equalTo: mainStackView.rightAnchor, constant: Constantes.margenDerecho),
            campoDeTextoRadicado.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func agregarConstraintsBoton() {
        botonConsultar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botonConsultar.topAnchor.constraint(equalTo: campoDeTextoRadicado.bottomAnchor,constant: Constantes.espacioInferior),
            botonConsultar.leftAnchor.constraint(equalTo: mainStackView.leftAnchor, constant: Constantes.margenIzquierdo),
            botonConsultar.rightAnchor.constraint(equalTo: mainStackView.rightAnchor, constant: Constantes.margenDerecho),
            botonConsultar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            botonConsultar.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

extension HomeVista: HomeVistaProtocolo {
    func botonConsultarPresionado() {
        guard let miJefe = miJefe else {
            return
        }
        miJefe.procesarToqueBotonConsultar()
    }
    
    func asignarJefe(_ jefe: JefeHomeVista) {
        miJefe = jefe
    }
    
    func obtenerNumeroRadicacion() -> String? {
        return campoDeTextoRadicado.text
    }
}
