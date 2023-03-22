//
//  HomeVista.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol HomeVistaProtocolo where Self: UIView {
    
}

class HomeVista: UIView, HomeVistaProtocolo {

    private let mainStackView = HomeStackView()
    private let botonConsultar = HomeBotonConsultar()
    private let campoDeTextoRadicado = HomeCampoDeTexto()
    private let labelConsultarProceso = HomeLabelConsultarProceso()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        agregarColorDeFondoAlView()
        agregarSubvistas()
        agregarConstraints()
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
            labelConsultarProceso.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 40),
            labelConsultarProceso.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            labelConsultarProceso.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            labelConsultarProceso.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        ])
    }
    
   private func agregarConstraintsCampoDeTexto() {
        campoDeTextoRadicado.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            campoDeTextoRadicado.topAnchor.constraint(equalTo: labelConsultarProceso.bottomAnchor,constant: 100),
            campoDeTextoRadicado.leftAnchor.constraint(equalTo: mainStackView.leftAnchor, constant: 20),
            campoDeTextoRadicado.rightAnchor.constraint(equalTo: mainStackView.rightAnchor, constant: -20),
            campoDeTextoRadicado.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
   private func agregarConstraintsBoton() {
        botonConsultar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botonConsultar.topAnchor.constraint(equalTo: campoDeTextoRadicado.bottomAnchor,constant: 100),
            botonConsultar.leftAnchor.constraint(equalTo: mainStackView.leftAnchor, constant: 20),
            botonConsultar.rightAnchor.constraint(equalTo: mainStackView.rightAnchor, constant: -20),
            botonConsultar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            botonConsultar.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
