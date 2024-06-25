//
//  HomePresenter.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.02.2024.
//

let video = URL(string: "https://samplelib.com/lib/preview/mp4/sample-5s.mp4")!
enum Prompts {
    static let quiz = """
    Provide 10 unique questions in single JSON, about Swift programming language for a quiz game with six possible answers of this question.
    
    Root object with properties:
            1. category name
            2. array with question objects with properties like: question, array of answers, right answer string, answer explanation string
    
    JSON example:
    
    struct Root {
        let category: String
        let questions: [QuestionModel]
    }

        struct QuestionModel: Codable {
            let question: String
            let answers: [String]
            let correctAnswer: String
            let answerExplanation: String
        }
    """
}

import Foundation

final class HomePresenter: Presenter {
    
    var view: HomeViewControllerIn?
    
    init() {
    }
    
    func viewDidLoad() {
//        let message = Message(id: UUID(), role: .user, content: Prompts.quiz, createdAt: Date())
//        APIClientImpl.shared.sendMessage(messages: [message], completion: { [weak self] classicQuiz in
//            guard let classicQuiz, let self else {
//                return print("⭕️⭕️⭕️⭕️⭕️⭕️⭕️⭕️")
//            }
//            print("✅✅✅✅✅✅✅✅✅ Questions: \(classicQuiz.questions.count)")
//            
//            let collectionModel = self.makeViewModel(classicQuiz: classicQuiz)
//            self.view?.update(with: .init(collectionViewModel: collectionModel))
//        })
        
        let collectionModel = self.makeViewModel(classicQuiz: HomeUtils.quiz)
        self.view?.update(with: .init(collectionViewModel: collectionModel))
    }
    
    func makeViewModel(classicQuiz: ClassicQuizDTO) -> HomeCollectionView.ViewModel {
        
        // MARK: - Block 0 - Header
        let headerConfig = HeaderConfig(title: "Test Title", subtitle: "Test Subtitle", buttonTitle: "Test button", buttonLink: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, headerContentLink: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, isVideoHeader: false)
        let headerItem1 = HeaderCell.ViewModel(state: .empty, config: headerConfig, onGenerate: nil, hasCollections: false)
        let header = HomeCollectionView.ViewModel.Block(section: .header, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .header(headerItem1))
        ])
        
        // MARK: - Block 1
        let block1Model = ContentCell.ViewModel(title: "Test", previewUrl: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, onSelect: .nop)
        let block1 = HomeCollectionView.ViewModel.Block(section: .verticalDouble, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
        ])
        
        // MARK: - Block 2
        let block2Model = block1Model
        let block2 = HomeCollectionView.ViewModel.Block(section: .horizontal, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
        ])
        
        // MARK: - Block 3
        let block3Model = MultipleImageCell.ViewModel(
            title: "Test title",
            isPreviewed: false,
            items: [
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
            ], 
            onSelect: .nop
        )

        let block3 = HomeCollectionView.ViewModel.Block(section: .horizontalCollections, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
        ])
        
        // MARK: - Block 4 - Classic Quiz
        let block4Items = classicQuiz.questions.map {
            let model = ClassicQuizCell.ViewModel(
                state: .default,
                question: $0.question,
                asnwers: $0.answers, 
                category: classicQuiz.category,
                correctAnswer: $0.correctAnswer, 
                answerExplanation: $0.answerExplanation,
                image: nil
            )
            return HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicQuiz(model))
        }

        let block4 = HomeCollectionView.ViewModel.Block(section: .classicQuiz, items: block4Items)
        
        // MARK: - Result
        let viewModel = HomeCollectionView.ViewModel(
            blocks: [header, block4, block3, block2, block1],
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        
        return viewModel
    }
}
