//
//  CategoryGeneratorCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.07.2024.
//

import UIKit

final class CategoriesGeneratorCell: ImageCell {
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
        let categoryFetchParams: CategoryFetchParams
        let onGenerate: CommandWith<CategoryFetchParams>?
        
        static let initial = ViewModel(
            state: .loaded, title: "", subtitle: "", contentURL: nil,
            isVideo: false, categoryFetchParams: .initial, onGenerate: .nop
        )
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let categoriesCountLabel = UILabel()
    private let categoryNameTitleLabel = UILabel()
    private let localizationLabel = UILabel()
    private let subCategoriesCountLabel = UILabel()
    private let gradientImageView = UIImageView()
    private let playerView = LoopingVideoPlayerView(isAlwaysMuted: true)
    private let headerLabelsStack = UIStackView()
    private let labelsStack = UIStackView()
    private let textFieldsStack = UIStackView()
    private let generateButton = LoaderButton()
    private let categoryTextfield = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private let categoriesCountTextField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private let localizationTextField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
    private let subcategoriesCountTextField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
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
        categoryTextfield.text = viewModel.categoryFetchParams.rootCategory
        localizationTextField.text = nil
        categoriesCountTextField.text = viewModel.categoryFetchParams.numberOfCategories.description
        subcategoriesCountTextField.text = nil//viewModel.categoryFetchParams.numberOfSubCategories.description
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        playVideo(viewModel.isVideo, viewModel.contentURL)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        generateButton.onTouchUpInside = { [weak self] _ in
            self?.onGenerateCategories()
        }
        playVideo(viewModel.isVideo, viewModel.contentURL)
    }
    
    private func onGenerateCategories() {
        let fetchParams = CategoryFetchParams(
            numberOfCategories: Int(categoriesCountTextField.text ?? "")!,
            rootCategory: categoryTextfield.text ?? ""
        )
        viewModel.onGenerate?.perform(with: fetchParams)
        generateButton.startLoading()
        hideKeyboard()
    }
    
    private func configureView() {
        configureTextfield(categoryTextfield)
        configureTextfield(categoriesCountTextField)
        configureTextfield(localizationTextField)
        configureTextfield(subcategoriesCountTextField)
        labelsStack.distribution = .fillEqually
        labelsStack.spacing = 6
        labelsStack.axis = .vertical
        textFieldsStack.distribution = .fillEqually
        textFieldsStack.spacing = 2
        textFieldsStack.axis = .vertical
        headerLabelsStack.axis = .vertical
        headerLabelsStack.alignment = .center
        headerLabelsStack.spacing = 2
        categoriesCountTextField.keyboardType = .numberPad
        subcategoriesCountTextField.keyboardType = .numberPad
        titleLabel.textColor = .black
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
        categoriesCountLabel.text = "Categories"
        categoriesCountLabel.textColor = .white
        categoriesCountLabel.font = .systemFont(ofSize: 13)
        subCategoriesCountLabel.text = "Sub-categories"
        subCategoriesCountLabel.textColor = .white
        subCategoriesCountLabel.font = .systemFont(ofSize: 13)
        localizationLabel.text = "Language"
        localizationLabel.textColor = .white
        localizationLabel.font = .systemFont(ofSize: 13)
        categoryNameTitleLabel.text = "Root Category"
        categoryNameTitleLabel.textColor = .white
        categoryNameTitleLabel.font = .systemFont(ofSize: 13)
    }
    
    private func configureLayout() {
        contentView.addSubviews([
            playerView,
            imageView,
            gradientImageView,
            headerLabelsStack,
            labelsStack,
            textFieldsStack,
            generateButton
        ])
        headerLabelsStack.addArrangedSubviews([
            titleLabel,
            descriptionLabel,
        ])
        labelsStack.addArrangedSubviews([
            categoryNameTitleLabel,
            categoriesCountLabel,
            subCategoriesCountLabel,
            localizationLabel,
        ])
        textFieldsStack.addArrangedSubviews([
            categoryTextfield,
            categoriesCountTextField,
            subcategoriesCountTextField,
            localizationTextField,
        ])
        
        labelsStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(headerLabelsStack.snp.bottom)
        }
        textFieldsStack.snp.makeConstraints { make in
            make.leading.equalTo(labelsStack.snp.trailing)
            make.top.equalTo(labelsStack.snp.top)
        }
        
        headerLabelsStack.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
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
        
        generateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldsStack.snp.bottom).offset(8)
        }
    }
    
    private func configureTextfield(_ textfield: UITextField) {
        textfield.textColor = .white
        textfield.returnKeyType = .done
        textfield.borderStyle = .none
        textfield.backgroundColor = .halfBlack
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.font = .systemFont(ofSize: 13)
    }
    
    private func hideKeyboard() {
        [categoriesCountTextField, categoryTextfield, subcategoriesCountTextField, localizationTextField]
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
