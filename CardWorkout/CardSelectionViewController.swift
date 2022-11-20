//
//  CardSelectionViewController.swift
//  CardWorkout
//
//  Created by Vinicius Kammradt on 19/11/22.
//

import UIKit

class CardSelectionViewController: UIViewController {

    let cardImageView = UIImageView()

    let stopButton = CardWorkoutButton(color: .systemRed, title: "Stop!", iconName: "stop.circle")
    let resetButton = CardWorkoutButton(color: .systemGreen, title: "Reset", iconName: "arrow.clockwise")
    let rulesButton = CardWorkoutButton(color: .systemBlue, title: "Rules", iconName: "list.bullet")

    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        startTimer()
    }

    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }

    @objc func stopTimer() {
        self.timer.invalidate()
    }

    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }

    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }

    func setupUI() {
        setupCardImageView()
        setupStopButton()
        setupResetButton()
        setupRulesButton()
    }

    func setupCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")

        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }

    func setupStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }

    func setupResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }

    func setupRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(goToRulesViewController), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }

    @objc func goToRulesViewController() {
        present(RulesViewController(), animated: true)
    }

}
