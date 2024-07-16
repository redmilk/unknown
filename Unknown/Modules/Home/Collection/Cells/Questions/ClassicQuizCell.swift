//
//  ClassicQuizCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.06.2024.
//

import UIKit
import SnapKit
import AVKit

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
        let curiousFacts: [String]
        let image: URL?
        let isLatestAnsweredQuiz: Bool
        let onAnswerPressed: CommandWith<String>
        
        static let initial: ViewModel = .init(
            state: .default, question: "", asnwers: [], category: "", correctAnswer: "",
            answerExplanation: "", curiousFacts: [], image: nil, isLatestAnsweredQuiz: false, onAnswerPressed: .nop
        )
    }
    
    private let containerStack = UIStackView()
    private let imageView = UIImageView()
    private let questionLabel = UILabel()
    private let categoryLabel = UILabel()
    private let explanationLabel = UILabel()
    private let answersStack = UIStackView()
    private let factsStack = UIStackView()
    private var synthesizer = AVSpeechSynthesizer()
    private var viewModel: ViewModel = .initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        buildAnswerViews(correct: viewModel.correctAnswer, answers: viewModel.asnwers)
        questionLabel.text = viewModel.question
        categoryLabel.text = viewModel.category
        explanationLabel.text = viewModel.answerExplanation
        explanationLabel.isHidden = !viewModel.state.isAnswered
        answersStack.isUserInteractionEnabled = !viewModel.state.isAnswered
        speakExplanationIfNeeded(viewModel: viewModel)
        buildCuriousFactLabels(viewModel.curiousFacts)
        factsStack.isHidden = !viewModel.state.isAnswered
        imageView.isHidden = viewModel.image == nil
        imageView.sd_setImage(with: viewModel.image)
    }
    
    private func configureView() {
        contentView.backgroundColor = .black
        containerStack.backgroundColor = .clear
        clipsToBounds = true
        containerStack.axis = .vertical
        containerStack.spacing = 8
        answersStack.axis = .vertical
        answersStack.spacing = 2
        factsStack.axis = .vertical
        factsStack.spacing = 4
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        categoryLabel.textColor = .ultraBlue
        categoryLabel.textAlignment = .center
        categoryLabel.font = Style.Font.tiny
        explanationLabel.textColor = .white
        explanationLabel.numberOfLines = 0
        explanationLabel.font = Style.Font.small
        imageView.makeRounded(12)
    }
    
    private func configureLayout() {
        //contentView.addSubview()
//        imageView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        
        contentView.addSubview(containerStack)
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerStack.addArrangedSubviews([
            imageView,
            categoryLabel,
            questionLabel,
            answersStack,
            explanationLabel,
            factsStack
        ])
    }
    
    private func speakExplanationIfNeeded(viewModel: ViewModel) {
        guard viewModel.state.isAnswered, viewModel.isLatestAnsweredQuiz else {
            synthesizer.stopSpeaking(at: .immediate)
            return
        }
        let utterance = AVSpeechUtterance(string: viewModel.answerExplanation)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1
        //synthesizer.speak(utterance)
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
    
    private func buildCuriousFactLabels(_ facts: [String]) {
        factsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        facts.forEach {
            let label = UILabel()
            label.text = "▫️ \($0)"
            label.numberOfLines = 0
            label.font = Style.Font.small
            label.textColor = .toolTipLightBlue
            label.textAlignment = .left
            factsStack.addArrangedSubview(label)
        }
    }
    
    private func makeButton(buttonTitle: String, correctAnswer: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .ultraBlue
        button.titleLabel?.numberOfLines = 0
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = Style.Font.normal
        button.addTarget(self, action: #selector(onAnswerTap(_:)), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        
        switch viewModel.state {
        case .correctAnswer where buttonTitle == correctAnswer:
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            button.backgroundColor = .green
            button.setTitleColor(.black, for: .normal)
        case .wrongAnswer(let givenAnswer) where buttonTitle == givenAnswer:
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.red.cgColor
            button.backgroundColor = .halfBlack
            //button.setTitleColor(.black, for: .normal)
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
