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
    var stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
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
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
}
