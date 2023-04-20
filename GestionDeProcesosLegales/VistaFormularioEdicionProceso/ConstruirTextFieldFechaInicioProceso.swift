//
//  ConstruirTextFieldFechaInicioProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

class ConstruirTextFieldFechaInicioProceso {
    
    private static var textField: UITextField?
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 16.0
        static let texto = "Fecha inicio del proceso"
        static let colorTexto: UIColor = .darkGray
        static let colorDelCursor: UIColor = .darkGray
    }
    
    static func crear() -> UITextField {
        let selectorDeFecha = UIDatePicker()
        let textField = UITextField()
        configurar(textField: textField)
        configurarSelectorFecha(selectorDeFecha: selectorDeFecha)
        configurarBarraDeHerramientas(textField: textField)
        configurarTextField(textField: textField, selectorDeFecha: selectorDeFecha)
        self.textField = textField
        return textField
    }
    
    private static func configurarSelectorFecha(selectorDeFecha: UIDatePicker) {
        selectorDeFecha.datePickerMode = .date
        selectorDeFecha.preferredDatePickerStyle = .wheels
    }
    
    private static func configurar(textField: UITextField) {
        textField.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente, weight: .semibold)
        textField.textColor = Constantes.colorTexto
        textField.tintColor = Constantes.colorDelCursor
        textField.borderStyle = .none
        textField.placeholder = Constantes.texto
        textField.keyboardType = .default
        textField.clearButtonMode = .whileEditing
    }
    
    private static func configurarBarraDeHerramientas(textField: UITextField) {
        let barraDeHerramientas = UIToolbar()
        barraDeHerramientas.sizeToFit()
        let botonListo = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(botonListoTocado(_:)))
        barraDeHerramientas.setItems([botonListo], animated: false)
        textField.inputAccessoryView = barraDeHerramientas
    }
    
    private static func configurarTextField(textField: UITextField, selectorDeFecha: UIDatePicker) {
        selectorDeFecha.addTarget(self, action: #selector(selectorDeFechaCambiado(_:)), for: .valueChanged)
        textField.inputView = selectorDeFecha
    }
    
    @objc private static func selectorDeFechaCambiado(_ sender: UIDatePicker) {
        guard let textField = textField else { return }
        let formateadorDeFecha = DateFormatter()
        formateadorDeFecha.dateStyle = .medium
        formateadorDeFecha.timeStyle = .none
        formateadorDeFecha.locale = Locale.current
        textField.text = formateadorDeFecha.string(from: sender.date)
    }
    
    @objc private static func botonListoTocado(_ sender: UIBarButtonItem) {
        guard let textField = textField else { return }
        textField.endEditing(true)
    }
}
