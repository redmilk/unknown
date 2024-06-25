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
        case wrongAnswer
        // case answerExplanation
    }
    
    struct ViewModel {
        let state: State
        let question: String
        let asnwers: [String]
        let category: String
        let correctAnswer: String
        let image: URL?
    }
    
    private let containerStack = UIStackView()
    private let imageView = UIImageView()
    private let questionLabel = UILabel()
    private let categoryLabel = UILabel()
    private let answersStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: ViewModel) {
        buildAnswerViews(answers: model.asnwers)
        questionLabel.text = model.question
        categoryLabel.text = model.category
    }
    
    private func configureView() {
        clipsToBounds = true
        containerStack.axis = .vertical
        answersStack.axis = .vertical
        answersStack.spacing = 8
        questionLabel.textColor = .white
        categoryLabel.textColor = .white
        questionLabel.numberOfLines = 0
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
        
        categoryLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        containerStack.addArrangedSubviews([
            categoryLabel,
            questionLabel,
            answersStack
        ])
    }
    
    private func buildAnswerViews(answers: [String]) {
        guard answersStack.arrangedSubviews.isEmpty else { return }
        var pair = [String]()
        answers.forEach { answer in
            pair.append(answer)
            guard pair.count == 2 else { return }
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.spacing = 8
            pair.forEach {
                let button = UIButton()
                button.setTitle($0, for: .normal)
                stack.addArrangedSubview(button)
            }
            answersStack.addArrangedSubview(stack)
            pair.removeAll()
        }
    }
}
