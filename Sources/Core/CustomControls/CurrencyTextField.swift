//
//  CurrencyTextField.swift
//  CurrencyTextFieldDemo
//
//  Created by Deshmukh,Richa on 6/2/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import UIKit

@IBDesignable open class CurrencyTextField: UITextField {
    private let maxDigits = 12

    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2

        return formatter
    }()

    // MARK: Private variables

    private var defaultValue = 0.00

    private var previousValue = String.empty

    // MARK: Computed variables

    public var value: Double {
        return Double(getCleanNumberString()).or(0) / 100
    }

    // MARK: Initializers

    override public init(frame: CGRect) {
        super.init(frame: frame)

        setupTextField()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupTextField()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: Override functions

    override open func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(
                self, selector: .textDidChange, name: UITextField.textDidChangeNotification, object: self
            )
        }
    }

    // MARK: Private functions

    private func setupTextField() {
        keyboardType = .decimalPad

        setAmount(defaultValue)
    }

    private func setAmount (_ amount: Double) {
        let textFieldStringValue = currencyFormatter.string(from: NSNumber(value: amount))

        text = textFieldStringValue

        textFieldStringValue.flatMap { previousValue = $0 }
    }

    private func getCleanNumberString() -> String {
        return text.or(.empty).components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    private func getOriginalCursorPosition() -> Int {
        guard let selectedTextRange = selectedTextRange else { return 0 }

        return offset(from: beginningOfDocument, to: selectedTextRange.start)
    }

    private func setCursorOriginalPosition(_ cursorOffset: Int, oldTextFieldLength: Int?) {
        let newLength = text.or(.empty).count
        let startPosition = beginningOfDocument

        if let oldTextFieldLength = oldTextFieldLength, oldTextFieldLength > cursorOffset {
            let newOffset = newLength - oldTextFieldLength + cursorOffset
            let newCursorPosition = position(from: startPosition, offset: newOffset)

            if let newCursorPosition = newCursorPosition {
                let newSelectedRange = textRange(from: newCursorPosition, to: newCursorPosition)

                selectedTextRange = newSelectedRange
            }
        }
    }

    // MARK: Fileprivate functions

    @objc fileprivate func textDidChange(_ notification: Notification) {
        let cursorOffset = getOriginalCursorPosition()
        let cleanNumericString = getCleanNumberString()
        let textFieldLength = text.or(.empty).count
        let textFieldNumber = Double(cleanNumericString).or(0)

        if cleanNumericString.count <= maxDigits {
            setAmount(textFieldNumber / 100)
        } else {
            text = previousValue
        }

        setCursorOriginalPosition(cursorOffset, oldTextFieldLength: textFieldLength)
    }
}

private extension Selector {
    static let textDidChange = #selector(CurrencyTextField.textDidChange)
}
