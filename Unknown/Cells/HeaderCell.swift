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
        let category: String
        let contentURL: URL
        let isVideo: Bool
        let onGenerate: CommandWith<String>?
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let gradientImageView = UIImageView()
    private let playerView = LoopingVideoPlayerView(isAlwaysMuted: true)
    private let containerStack = UIStackView()   
    private let generateButton = LoaderButton()
    private let textField = InsetTextfield(textInsets: .init(top: 2, left: 4, bottom: 2, right: 4))

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
        switch viewModel.state {
        case .loading: generateButton.startLoading()
        case .loaded: generateButton.stopLoading()
        }
        textField.text = viewModel.category
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        playVideo(viewModel.isVideo, viewModel.contentURL)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(generateButton.snp.centerX)
        }
        generateButton.onTouchUpInside = { [weak self] _ in
            viewModel.onGenerate?.perform(with: self?.textField.text ?? "")
            self?.generateButton.startLoading()
            self?.textField.resignFirstResponder()
        }
        playVideo(viewModel.isVideo, viewModel.contentURL)
    }
    
    private func configureView() {
        containerStack.axis = .vertical
        containerStack.alignment = .center
        containerStack.spacing = 2
        textField.textColor = .white
        textField.returnKeyType = .done
        textField.borderStyle = .none
        textField.backgroundColor = .halfBlack
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.font = .systemFont(ofSize: 13, weight: .light)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20, weight: .black)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .bold)
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
            containerStack
        ])
        containerStack.addArrangedSubviews([
            titleLabel,
            descriptionLabel,
            textField,
            generateButton
        ])
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

