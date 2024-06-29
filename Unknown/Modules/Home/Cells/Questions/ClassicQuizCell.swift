//
//  ClassicQuizCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.06.2024.
//

import UIKit
import SnapKit

final class ClassicQuizCell: UICollectionViewCell {
    
    enum State {
        case `default`
        case correctAnswer
        case wrongAnswer(String)
        
        init(answerState: AnswerState) {
            switch answerState {
            case .default: self = .default
            case .right: self = .correctAnswer
            case .wrong(let answer): self = .wrongAnswer(answer)
            }
        }
        
        var isAnswered: Bool {
            switch self {
            case .default: return false
            case _: return true
            }
        }
    }
    
    struct ViewModel {
        let state: State
        let question: String
        let asnwers: [String]
        let category: String
        let correctAnswer: String
        let answerExplanation: String
        let image: URL?
        let onAnswerPressed: CommandWith<String>
        
        static let initial: ViewModel = .init(
            state: .default, question: "", asnwers: [], category: "",
            correctAnswer: "", answerExplanation: "", image: nil, onAnswerPressed: .nop
        )
    }
    
    private let containerStack = UIStackView()
    private let imageView = UIImageView()
    private let questionLabel = UILabel()
    private let categoryLabel = UILabel()
    private let explanationLabel = UILabel()
    private let answersStack = UIStackView()
    private var viewModel: ViewModel = .initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: ViewModel) {
        self.viewModel = model
        buildAnswerViews(correct: model.correctAnswer, answers: model.asnwers)
        questionLabel.text = model.question
        categoryLabel.text = model.category
        explanationLabel.text = model.answerExplanation
        explanationLabel.isHidden = !model.state.isAnswered
    }
    
    private func configureView() {
        clipsToBounds = true
        containerStack.axis = .vertical
        containerStack.spacing = 0
        answersStack.axis = .vertical
        answersStack.spacing = 2
        questionLabel.textColor = .red
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        categoryLabel.textColor = .white
        categoryLabel.textAlignment = .center
        categoryLabel.font = .systemFont(ofSize: 11)
        explanationLabel.textColor = .gray1
        explanationLabel.numberOfLines = 0
        explanationLabel.font = .systemFont(ofSize: 13)
    }
    
    private func configureLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(containerStack)
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerStack.addArrangedSubviews([
            categoryLabel,
            questionLabel,
            answersStack,
            explanationLabel
        ])
    }
    
    private func buildAnswerViews(correct: String, answers: [String]) {
        answersStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        var pair = [String]()
        answers.forEach { answer in
            pair.append(answer)
            guard pair.count == determineAnswersCountInLine(answers) else { return }
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.spacing = 2
            pair.forEach {
                let button = makeButton(buttonTitle: $0, correctAnswer: correct)
                stack.addArrangedSubview(button)
            }
            answersStack.addArrangedSubview(stack)
            pair.removeAll()
        }
    }
    
    private func makeButton(buttonTitle: String, correctAnswer: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .blueDark
        button.titleLabel?.numberOfLines = 0
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(onAnswerTap(_:)), for: .touchUpInside)
        
        switch viewModel.state {
        case .correctAnswer where buttonTitle == correctAnswer:
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.green.cgColor
        case .wrongAnswer(let givenAnswer) where buttonTitle == givenAnswer:
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.red.cgColor
        case _: break
        }
        return button
    }
    
    @objc 
    private func onAnswerTap(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        viewModel.onAnswerPressed.perform(with: text)
    }
    
    private func determineAnswersCountInLine(_ answers: [String]) -> Int {
        let isShortAnswers = answers.filter { $0.count > Constants.considarableShortAnswer }.isEmpty
        let isLongAnswers = !answers.filter { $0.count > Constants.considarableLongAnswer }.isEmpty
        
        if isLongAnswers {
            return 1
        } else if isShortAnswers {
            return 4
        } else {
            return 2
        }
    }
    
    private enum Constants {
        static let considarableLongAnswer: Int = 17
        static let considarableShortAnswer: Int = 5
    }
}
