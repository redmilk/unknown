//
//  HeaderCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import SnapKit

final class HeaderCell: ImageCell {
    enum State {
        case loading
        case loaded
    }
    struct ViewModel {
        let state: State
        let title: String
        let subtitle: String
        let contentURL: URL?
        let isVideo: Bool
        let classicQuizFetchParams: ClassicQuizFetchParams
        let onGenerateClassicQuiz: CommandWith<ClassicQuizFetchParams>?
        
        static let initial = ViewModel(
            state: .loaded, title: "", subtitle: "", contentURL: nil,
            isVideo: false, classicQuizFetchParams: .initial, onGenerateClassicQuiz: .nop
        )
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let answersCountTitleLabel = UILabel()
    private let categoryNameTitleLabel = UILabel()
    private let localizationLabel = UILabel()
    private let questionsCountLabel = UILabel()
    private let gradientImageView = UIImageView()
    private let playerView = LoopingVideoPlayerView(isAlwaysMuted: true)
    private let containerStack = UIStackView()   
    private let fetchParamsStack = UIStackView()
    private let categoryStack = UIStackView()
    private let answersCountStack = UIStackView()
    private let localizationStack = UIStackView()
    private let questionsCountStack = UIStackView()
    private let generateButton = LoaderButton()
    private let categoryTextfield = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private let answersCountTextField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private let localizationTextField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private let questionsCountTextField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private var viewModel: ViewModel = .initial

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playerView.stop()
        playerView.isHidden = true
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        switch viewModel.state {
        case .loading: generateButton.startLoading()
        case .loaded: generateButton.stopLoading()
        }
        categoryTextfield.text = viewModel.classicQuizFetchParams.categoryName
        localizationTextField.text = viewModel.classicQuizFetchParams.localization.value
        answersCountTextField.text = viewModel.classicQuizFetchParams.answersCount.description
        questionsCountTextField.text = viewModel.classicQuizFetchParams.questionsCount.description
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        playVideo(viewModel.isVideo, viewModel.contentURL)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        generateButton.onTouchUpInside = { [weak self] _ in
            self?.onGenerateClassicQuiz()
        }
        playVideo(viewModel.isVideo, viewModel.contentURL)
    }
    
    private func onGenerateClassicQuiz() {
        let fetchParams = ClassicQuizFetchParams(
            categoryName: categoryTextfield.text ?? "",
            answersCount: Int(answersCountTextField.text ?? "")!, 
            questionsCount: Int(questionsCountTextField.text ?? "")!,
            localization: .other(localizationTextField.text ?? "English")
        )
        viewModel.onGenerateClassicQuiz?.perform(with: fetchParams)
        generateButton.startLoading()
        hideKeyboard()
    }
    
    private func configureView() {
        configureTextfield(categoryTextfield)
        configureTextfield(answersCountTextField)
        configureTextfield(localizationTextField)
        configureTextfield(questionsCountTextField)
        containerStack.axis = .vertical
        containerStack.alignment = .center
        containerStack.spacing = 2
        fetchParamsStack.axis = .vertical
        fetchParamsStack.distribution = .equalSpacing
        answersCountTextField.keyboardType = .numberPad
        questionsCountTextField.keyboardType = .numberPad
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20, weight: .black)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .ultraLight)
        descriptionLabel.numberOfLines = 0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        gradientImageView.image = UIImage(named: "rect")!
        generateButton.backgroundColor = .ultraBlue
        generateButton.titleLabel?.textColor = .white
        generateButton.titleLabel?.font = .systemFont(ofSize: 13)
        generateButton.layer.cornerRadius = 12
        generateButton.layer.masksToBounds = true
        answersCountStack.axis = .horizontal
        answersCountStack.distribution = .fillEqually
        categoryStack.axis = .horizontal
        categoryStack.distribution = .fillEqually
        localizationStack.axis = .horizontal
        localizationStack.distribution = .fillEqually
        questionsCountStack.axis = .horizontal
        questionsCountStack.distribution = .fillEqually
        answersCountTitleLabel.text = "Answers"
        answersCountTitleLabel.textColor = .white
        answersCountTitleLabel.font = .systemFont(ofSize: 13)
        questionsCountLabel.text = "Questions"
        questionsCountLabel.textColor = .white
        questionsCountLabel.font = .systemFont(ofSize: 13)
        localizationLabel.text = "Language"
        localizationLabel.textColor = .white
        localizationLabel.font = .systemFont(ofSize: 13)
        categoryNameTitleLabel.text = "Category"
        categoryNameTitleLabel.textColor = .white
        categoryNameTitleLabel.font = .systemFont(ofSize: 13)
    }
    
    private func configureLayout() {
        contentView.addSubviews([
            playerView,
            imageView,
            gradientImageView,
            containerStack
        ])
        containerStack.addArrangedSubviews([
            titleLabel,
            descriptionLabel,
            fetchParamsStack,
            generateButton
        ])
        fetchParamsStack.addArrangedSubviews([
            categoryStack,
            answersCountStack,
            localizationStack,
            questionsCountStack
        ])
        categoryStack.addArrangedSubviews([categoryNameTitleLabel, categoryTextfield])
        answersCountStack.addArrangedSubviews([answersCountTitleLabel, answersCountTextField])
        localizationStack.addArrangedSubviews([localizationLabel, localizationTextField])
        questionsCountStack.addArrangedSubviews([questionsCountLabel, questionsCountTextField])
        
        containerStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.2)
        }
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        gradientImageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(contentView.bounds.height * 0.35)
        }
        playerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureTextfield(_ textfield: UITextField) {
        textfield.textColor = .white
        textfield.returnKeyType = .done
        textfield.borderStyle = .none
        textfield.backgroundColor = .halfBlack
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.font = .systemFont(ofSize: 13, weight: .light)
    }
    
    private func hideKeyboard() {
        [questionsCountTextField, categoryTextfield, answersCountTextField, localizationTextField]
            .forEach { $0.resignFirstResponder() }
    }
    
    private func playVideo(_ isVideo: Bool, _ url: URL?) {
        if isVideo {
            playerView.isHidden = false
            imageView.isHidden = true
            renderVideo(url)
        } else {
            playerView.isHidden = true
            imageView.isHidden = false
            setImageURL(url)
        }
    }
    
    private func renderVideo(_ url: URL?) {
        guard let url = url else {
            return
        }
        playerView.put(url)
        playerView.player.play()
    }
}

