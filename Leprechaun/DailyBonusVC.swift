//
//  DailyBonusVC.swift
//  Leprechaun
import Foundation
import UIKit
import UIKit

class DailyBonusVC: UIViewController {

    private let numbers = [10, 5, 10, 15, 20]
    private var currentValues: [Int] = [0]
    private var targetValues: [Int] = []
    private var timers: [Timer] = []
    private var selectedValues: [Int] = []
    private var win = 0
    private var countTimer = 0
    private var isTime: Bool = true


    private var contentView: DailyBonusView {
        view as? DailyBonusView ?? DailyBonusView()
    }

    override func loadView() {
        view = DailyBonusView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupValuePicker()
        setupActions()
        setupPicker()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            goDailyScreen()
    }

    private func setupValuePicker() {
        contentView.valuePicker.delegate = self
        contentView.valuePicker.dataSource = self
    }
    
    
    
    private func setupActions() {
        contentView.backBtn.addTarget(self, action: #selector(backBtnTap), for: .touchUpInside)
        contentView.getBonusButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        contentView.backTimerBtn.addTarget(self, action: #selector(backBtnTap), for: .touchUpInside)
        contentView.okBonusButton.addTarget(self, action: #selector(backBtnTap), for: .touchUpInside)
    }
    
    func presentDailyPrizeVC() {
        let dailyPrizeVC = DailyPrizeVC()
        dailyPrizeVC.total = win
        dailyPrizeVC.modalPresentationStyle = .fullScreen
        present(dailyPrizeVC, animated: true, completion: nil)
    }

    // MARK: - Actions
    @objc private func backBtnTap() {
        goBack()
    }

    @objc private func startButtonTapped() {
            contentView.getBonusButton.isUserInteractionEnabled = false
            generateTargetValues()
            startTimers()
    }
    
}

// MARK: - Logic
extension DailyBonusVC {
    private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupPicker() {
        let initialRow = 1
        contentView.valuePicker.selectRow(initialRow, inComponent: 0, animated: false)
    }
    
    private func generateTargetValues() {
        targetValues = (0..<currentValues.count).map { _ in
            Int.random(in: 20...70)
        }
    }
    
    // MARK: - Timer
    private func startTimers() {
        for i in 0..<currentValues.count {
            let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updatePicker(_:)), userInfo: ["column": i], repeats: true)
            timers.append(timer)
        }
    }
    
    @objc private func updatePicker(_ timer: Timer) {
        guard let userInfo = timer.userInfo as? [String: Any],
              let column = userInfo["column"] as? Int else {
            return
        }
        
        currentValues[column] += 1
        contentView.valuePicker.selectRow(currentValues[column] % (numbers.count * 20), inComponent: column, animated: true)
        
        if currentValues[column] >= targetValues[column] {
            timer.invalidate()
            let targetValue = targetValues[column]
            let hiddenNumber = findHiddenNumber(targetValue: targetValue)
            countTimer += 1
            win += hiddenNumber
            if countTimer == 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    UD.shared.balance += self.win
                    print("win- \(self.win)")
                    print("\(UD.shared.balance)")
                    self.presentDailyPrizeVC()
                    self.contentView.getBonusButton.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    func findHiddenNumber(targetValue: Int) -> Int {
        let array = [0, 5, 10, 15, 20]
        let repeatedArray = Array(repeating: array, count: 20).flatMap { $0 }
        
        let index = targetValue % array.count
        let hiddenNumberIndex = (index + array.count) % array.count
        
        return repeatedArray[hiddenNumberIndex]
    }
}


extension DailyBonusVC: UIPickerViewDelegate {
    
}

extension DailyBonusVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count * 20
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let repeatedNumbers = Array(repeating: numbers, count: 20).flatMap { $0 }
            return "\(repeatedNumbers[row % numbers.count])"
        }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let containerView = UIView()

        let label = UILabel()
        let imageView = UIImageView()

        let repeatedNumbers = Array(repeating: numbers, count: 20).flatMap { $0 }
        let selectedValue = repeatedNumbers[row % numbers.count]

        label.text = "\(selectedValue)"
        label.textAlignment = .center
        label.font = UIFont.customFont(font: .mont, style: .black, size: 24)

        if row == pickerView.selectedRow(inComponent: component) {
            label.textColor = .gradGreenTwo
            label.backgroundColor = .clear
        } else {
            label.backgroundColor = .white.withAlphaComponent(0.5)
        }

        imageView.image = .coint         
        imageView.contentMode = .scaleAspectFit

        let padding: CGFloat = 20.0
        let imageSize: CGFloat = 20.0

        imageView.frame = CGRect(x: 100, y: 5, width: imageSize, height: imageSize)
        label.frame = CGRect(x: 160, y: 5, width: containerView.frame.width - imageSize - padding, height: imageSize)

        containerView.addSubview(imageView)
        containerView.addSubview(label)
        containerView.backgroundColor = .white
        containerView.layer.borderWidth = 1

        return containerView
    }
}

extension DailyBonusVC {
    func goDailyScreen() {
        if let lastVisitDate = UD.shared.lastBonusDate {
            let calendar = Calendar.current
            if let hours = calendar.dateComponents([.hour], from: lastVisitDate, to: Date()).hour, hours < 24 {
                isTime = true
                contentView.timerView.isHidden = false
                startCountdownTimer()
            } else {
                isTime = false
                contentView.timerView.isHidden = true
            }
        }
    }
    
    func startCountdownTimer() {
        let calendar = Calendar.current
        
        guard let lastVisitDate = UD.shared.lastBonusDate,
              let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate) else {
            return
        }
        
        let now = Date()
        if now < targetDate {
            let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
            let timeString = String(format: "%02d:%02d:%02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
            contentView.timerCountLabel.text = "\(timeString)"
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                guard let self = self else {
                    timer.invalidate()
                    return
                }
                
                let now = Date()
                if now >= targetDate {
                    UserDefaults.standard.set(now, forKey: "LastVisitDate")
                    self.dismiss(animated: true, completion: nil)
                    timer.invalidate()
                } else {
                    let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
                    let timeString = String(format: "%02d:%02d:%02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
                    self.contentView.timerCountLabel.text = "\(timeString)"
                }
            }
        } else {
            UserDefaults.standard.set(now, forKey: "LastVisitDate")
        }
    }

}
