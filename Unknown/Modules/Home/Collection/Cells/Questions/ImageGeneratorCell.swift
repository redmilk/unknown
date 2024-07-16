//
//  ImageGeneratorCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 16.07.2024.
//

import UIKit

final class ImageGeneratorCell: ImageCell {
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
        let imageFetchParams: DalleImageFetchParams
        let onGenerate: CommandWith<DalleImageFetchParams>?
        
        static let initial = ViewModel(
            state: .loaded, title: "", subtitle: "", contentURL: nil,
            isVideo: false, imageFetchParams: .initial, onGenerate: .nop
        )
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let promptLabel = UILabel()
    private let gradientImageView = UIImageView()
    private let playerView = LoopingVideoPlayerView(isAlwaysMuted: true)
    private let headerLabelsStack = UIStackView()
    private let labelsStack = UIStackView()
    private let textFieldsStack = UIStackView()
    private let generateButton = LoaderButton()
    private let promptTextfield = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))
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
        promptTextfield.text = viewModel.imageFetchParams.prompt
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        playVideo(viewModel.isVideo, viewModel.contentURL)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        generateButton.onTouchUpInside = { [weak self] _ in
            self?.onGenerateImage()
        }
        playVideo(viewModel.isVideo, viewModel.contentURL)
    }
    
    private func onGenerateImage() {
        guard let prompt = promptTextfield.text else { return }
        let fetchParams = DalleImageFetchParams(prompt: prompt, n: 1, size: "1024x1024")
        viewModel.onGenerate?.perform(with: fetchParams)
        generateButton.startLoading()
        hideKeyboard()
    }
    
    private func configureView() {
        configureTextfield(promptTextfield)
        labelsStack.distribution = .fillEqually
        labelsStack.spacing = 4
        labelsStack.axis = .vertical
        textFieldsStack.distribution = .fillEqually
        textFieldsStack.spacing = 0
        textFieldsStack.axis = .vertical
        headerLabelsStack.axis = .vertical
        headerLabelsStack.alignment = .center
        headerLabelsStack.spacing = 2
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
            promptLabel,
        ])
        textFieldsStack.addArrangedSubviews([
            promptTextfield,
        ])
        
        labelsStack.snp.makeConstraints { make in
            make.leading.equalToSuperview()
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
            make.top.equalTo(textFieldsStack.snp.bottom)
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
        [promptTextfield]
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
