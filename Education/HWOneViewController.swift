//
//  ViewController.swift
//  Education
//
//  Created by Liliia Neskoromna on 05.12.2020.
//

import UIKit

final class HWOneViewController: UIViewController {
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var outputLabel: UILabel!
    @IBOutlet private weak var factorialRecButton: UIButton!
    @IBOutlet private weak var factorialIterButton: UIButton!
    @IBOutlet private weak var fibonacciButton: UIButton!
    @IBOutlet private weak var piToNButton: UIButton!
    
    let functions = Functions.shared
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        addDoneButtonTo(inputTextField)
        
        configureStackView()
    }
    
    @IBAction func onButtonTypped(_ sender: UIButton) {
        
        guard let text = inputTextField.text else { return }
        guard let inputNumber = Int(text) else { return }
        
        if sender.tag == 1 {
            
            let result = functions.factorialRecursion(inputNumber)
            outputLabel.text = String(result)
            
        } else if sender.tag == 2 {
            
            let result = functions.factorialIteration(inputNumber)
            outputLabel.text = String(result)
            
        } else if sender.tag == 3 {
            
            var resultArray = [String]()
            let element = functions.fibonacci(inputNumber)
            
            element.forEach { num in
                resultArray.append(String(num))
            }
            
            let stringRepresentation = resultArray.joined(separator: ", ")
            outputLabel.text = stringRepresentation
            
        } else if sender.tag == 4 {
            
            let result = functions.piToN(inputNumber)
            outputLabel.text = String(result)
        }
    }
    
    private func configureStackView() {
        
        stackView.axis         = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment    = .fill
        stackView.spacing      = 45
        view.addSubview(stackView)
        setStackViewConstraint()
        addSubviewsToStackView()
    }
    
    private func addSubviewsToStackView() {
        
        stackView.addArrangedSubview(inputTextField)
        stackView.addArrangedSubview(outputLabel)
        stackView.addArrangedSubview(factorialRecButton)
        stackView.addArrangedSubview(factorialIterButton)
        stackView.addArrangedSubview(fibonacciButton)
        stackView.addArrangedSubview(piToNButton)
    }
    
    private func setStackViewConstraint() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                           constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                          constant: -50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -50).isActive = true
    }
}

extension HWOneViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension HWOneViewController {
    
    private func addDoneButtonTo(_ textField: UITextField) {

        let numberToolbar = UIToolbar()
        textField.inputAccessoryView = numberToolbar
        numberToolbar.sizeToFit()

        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))

        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)

        numberToolbar.items = [flexBarButton, doneButton]
    }

    @objc private func didTapDone() {
        view.endEditing(true)
    }
}
