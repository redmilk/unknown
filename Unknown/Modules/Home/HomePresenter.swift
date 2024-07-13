//
//  HomePresenter.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.02.2024.
//

import Foundation

final class HomePresenter: Presenter {
    
    var view: HomeViewControllerIn!
    
    private var viewModel: HomeViewController.ViewModel = .initial
    private var classicQuizFetchParams: ClassicQuizFetchParams = .initial
    private var categoriesFetchParams: CategoryFetchParams = .initial
    private var classicQuizList: [ClassicQuizModel] = []
    private var categoriesList: [CategoryRootModel] = []
    private var latestAnsweredID: String?
    
    init() { 
        // TODO: Add DI
    }
    
    func viewDidLoad() {
        viewModel = makeInitialViewModel()
        view?.update(with: viewModel)
//        /// TEST
//        let collectionModel = self.makeViewModel(classicQuiz: HomeUtils.quiz)
//        self.view?.update(with: .init(collectionViewModel: collectionModel))
    }
    
    func onGenerateImageForQuestion(_ question: String) async -> String? {
        let result = await APIClientImpl.shared.requestDalleImages(prompt: question, imageCount: 1, imageSize: "256x256")
        switch result {
        case .success(let urls): 
            return urls.first
        case .failure(let error):
            print(error.localizedDescription)
            return nil
        }
    }
    
    func onGenerateClassicPack(params: ClassicQuizFetchParams) {
        let message = Message(
            id: UUID(),
            role: .user,
            content: Prompts.getClassicQuiz(params: params),
            createdAt: Date()
        )
        APIClientImpl.shared.getClassicQuizModels(messages: [message], completion: { [weak self] questions in
            guard let self else { return }
            guard let questions else {
                DispatchQueue.main.async {
                    self.viewModel = self.makeViewModel()
                    self.view.update(with: self.viewModel)
                }
                return
            }
            print("✅ Questions: \(questions.count)")
            self.classicQuizList.insert(contentsOf: questions, at: 0)
            self.viewModel = self.makeViewModel()
            DispatchQueue.main.async {
                self.view?.update(with:self.viewModel)
            }
            
            DispatchQueue.global(qos: .default).async {
                FirestoreClient.shared.uploadClassicQuizModels(questions)
            }
        })
    }
    
    private func onGenerateCategories() {
        let params = CategoryFetchParams(
            numberOfCategories: categoriesFetchParams.numberOfCategories,
            rootCategory: categoriesFetchParams.rootCategory
        )
        let message = Message(
            id: UUID(),
            role: .user,
            content: Prompts.getCategories(params: params),
            createdAt: Date()
        )
        
        APIClientImpl.shared.getCategories(
            messages: [message],
            completion: { [weak self] categoryRoot in
                guard let self, let categoryRoot else { return }
                self.categoriesList.append(categoryRoot)
                self.viewModel = self.makeViewModel()
                self.view?.update(with: self.viewModel)
            }
        )
    }
    
    private func getTitleForSection(at indexPath: IndexPath) -> String? {
        guard let block = viewModel.collectionViewModel.blocks[safe: indexPath.section] else {
            return nil
        }
        switch block.section.kind {
        case .categoriesSection:
            guard let rootCategory = categoriesList[safe: indexPath.section - 1] else {
                return nil
            }
            return rootCategory.title
        case _: return nil
        }
    }
    
    private func makeInitialViewModel() -> HomeViewController.ViewModel {
        let headerBlock = makeHeaderBlock(isInitial: true)
        let collectionModel = HomeCollectionView.ViewModel(
            blocks: [headerBlock], 
            getTitleForSectionAtIndexPath: { [weak self] indexPath in
                return self?.getTitleForSection(at: indexPath) ?? "----"
            },
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        let viewModel = HomeViewController.ViewModel(state: .loaded, collectionViewModel: collectionModel)
        return viewModel
    }
    
    private func makeViewModel() -> HomeViewController.ViewModel {
        // MARK: - Block 0 - Header
        let headerBlock = makeHeaderBlock(isInitial: false)
        
        // MARK: - Block 1
        let block1Model = ContentCell.ViewModel(title: "Test", previewUrl: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, onSelect: .nop)
        let block1 = HomeCollectionView.ViewModel.Block(
            section: .init(hash: UUID().hashValue, kind: .verticalDouble),
            items: [
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            ]
        )
        
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
        
        let block3 = HomeCollectionView.ViewModel.Block(
            section: .init(hash: UUID().hashValue, kind: .horizontalCollections),
            items: [
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            ]
        )
        
        // MARK: - Block 4 - Classic Quiz
        let block4Items = classicQuizList.enumerated().map { pair in
            let model = ClassicQuizCell.ViewModel(
                state: .init(answerState: pair.element.answerState),
                question: pair.element.question,
                asnwers: pair.element.answers,
                category: pair.element.category,
                correctAnswer: pair.element.correctAnswer,
                answerExplanation: pair.element.answerExplanation, 
                curiousFacts: pair.element.facts,
                image: nil,
                isLatestAnsweredQuiz: latestAnsweredID == pair.element.id,
                onAnswerPressed: CommandWith(action: { [weak self] answer in
                    guard let self else { return }
                    let quizModel = self.classicQuizList.first(where: { $0.id == pair.element.id })
                    quizModel?.answerState = AnswerState(answer: answer, correctAnswer: pair.element.correctAnswer)
                    self.latestAnsweredID = quizModel?.id
                    self.viewModel = self.makeViewModel()
                    self.view?.update(with: self.viewModel)
                }), 
                onGenerateImage: CommandWith(action: { [weak self] indexPath in
                    guard let self else { return }
                    Task {
                        guard var quizModel = self.classicQuizList.first(where: { $0.id == pair.element.id }) else { return }
                        let imageURLString = await self.onGenerateImageForQuestion(quizModel.question) ?? ""
                        quizModel.imageURL = URL(string: imageURLString)
                        self.viewModel = self.makeViewModel()
                        self.view?.update(with: self.viewModel)
                    }
                })
            )
            return HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicQuiz(model))
        }

        let block4 = HomeCollectionView.ViewModel.Block(
            section: .init(hash: UUID().hashValue, kind: .classicQuiz),
            items: block4Items
        )
        
        let categories = makeCategoriesBlock()
        var blocks = [headerBlock, block4, block3, block1]
        blocks.insert(contentsOf: categories, at: 1)
        // MARK: - Result
        let collectionModel = HomeCollectionView.ViewModel(
            blocks: blocks, 
            getTitleForSectionAtIndexPath: { [weak self] indexPath in
                return self?.getTitleForSection(at: indexPath) ?? "----"
            },
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        
        let viewModel = HomeViewController.ViewModel(state: .loaded, collectionViewModel: collectionModel)

        return viewModel
    }
    
    private func makeHeaderBlock(isInitial: Bool) -> HomeCollectionView.ViewModel.Block {
        let classicGenerator = ClassicGeneratorCell.ViewModel(
            state: .loaded,
            title: "Classic Quiz Generator",
            subtitle: "",
            contentURL: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
            isVideo: true,
            classicQuizFetchParams: isInitial ? .initial : classicQuizFetchParams,
            onGenerateClassicQuiz: CommandWith(action: { [weak self] fetchParams in
                self?.onGenerateClassicPack(params: fetchParams)
                self?.classicQuizFetchParams = fetchParams
            })
        )
        let categoriesGenerator = CategoriesGeneratorCell.ViewModel(
            state: .loaded,
            title: "Categories Generator",
            subtitle: "",
            contentURL: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
            isVideo: true,
            categoryFetchParams: isInitial ? .initial : categoriesFetchParams,
            onGenerate: CommandWith(action: { [weak self] fetchParams in
                self?.onGenerateCategories()
                self?.categoriesFetchParams = fetchParams
            })
        )
        let header = HomeCollectionView.ViewModel.Block(
            section: .init(hash: UUID().hashValue, kind: .generators),
            items: [
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicGenerator(classicGenerator)),
                HomeCollectionView.Item(hash: UUID().hashValue, kind: .categoriesGenerator(categoriesGenerator))
            ]
        )
        return header
    }

    private func makeCategoriesBlock() -> [HomeCollectionView.ViewModel.Block] {
        guard !categoriesList.isEmpty else { return [] }
        var blocks: [HomeCollectionView.ViewModel.Block] = []
        categoriesList.forEach { category in
            let items = category.subCategories.map { subCategory in
                let viewModel = SubCategoryCell.ViewModel(title: subCategory.title)
                return HomeCollectionView.Item(hash: UUID().hashValue, kind: .subcategory(viewModel))
            }
            let block = HomeCollectionView.ViewModel.Block(
                section: .init(hash: UUID().hashValue, kind: .categoriesSection),
                items: items
            )
            blocks.append(block)
        }
        return blocks
    }
    
    private func onClassicQuizAnswerTap(_ answer: String, correctAnswer: String) {
        guard answer == correctAnswer else {
            return
        }
        
        
    }
}
