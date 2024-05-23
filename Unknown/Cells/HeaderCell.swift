//
//  HeaderCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import SnapKit

struct HeaderConfig {
    let title: String
    let subtitle: String
    let buttonTitle: String
    let buttonLink: URL
    let headerContentLink: URL
    let isVideoHeader: Bool
}

final class HeaderCell: ImageCell {
    
    enum State {
        case normal
        case title
        case empty
    }
    
    struct ViewModel {
        let state: State
        let config: HeaderConfig
        let onGenerate: Command?
        let hasCollections: Bool
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let gradientImageView = UIImageView()
    private let playerView = LoopingVideoPlayerView(isAlwaysMuted: true)
    private let generateButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
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
        titleLabel.text = ""
        descriptionLabel.text = viewModel.config.subtitle
        playVideo(viewModel.config.isVideoHeader, viewModel.config.headerContentLink)
        handleState(with: viewModel)
    }
    
    private func handleState(with viewModel: ViewModel) {
        switch viewModel.state {
        case .empty:
            configureEmptyGalleryStateAB(viewModel)
        case .title:
            [descriptionLabel, playerView, generateButton, gradientImageView, imageView].forEach {
                $0.removeFromSuperview()
            }
            titleLabel.snp.remakeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(32)
                make.bottom.equalToSuperview()
                make.top.equalToSuperview()
            }
        default: break
        }
    }

    private func configureEmptyGalleryStateAB(
        _ viewModel: ViewModel
    ) {
        contentView.addSubview(generateButton)
        generateButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalTo(titleLabel.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(190)
        }
        descriptionLabel.text = "L10n.Diffusion.Preview.headerNew"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 13)
        titleLabel.text = viewModel.config.title
        descriptionLabel.snp.remakeConstraints { make in
            make.bottom.equalTo(generateButton.snp.top).offset(-40)
            make.centerX.equalTo(generateButton.snp.centerX)
            make.height.equalTo(40)
        }
        generateButton.onTouchUpInside = { _ in
            
        }
        
        generateButton.setTitle(viewModel.config.buttonTitle, for: .normal)
        playVideo(viewModel.config.isVideoHeader, viewModel.config.headerContentLink)
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
}

extension HeaderCell {
    private func configureUI() {
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        gradientImageView.image = UIImage(named: "rect")!
        
        generateButton.backgroundColor = .ultraBlue
        generateButton.titleLabel?.textColor = .white
        generateButton.titleLabel?.font = .systemFont(ofSize: 13)
        //generateButton.makeRounded(18)
    }
    
    private func configureLayout() {
        contentView.addSubview(playerView)
        contentView.addSubview(imageView)
        contentView.addSubview(gradientImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(18)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(descriptionLabel.snp.topMargin).offset(-12)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientImageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(contentView.bounds.height * 0.35)
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
