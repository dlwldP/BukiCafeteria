import UIKit

class CategoryPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let categories = ["한식", "중식", "일식"]

    let images: [String: [String]] = [
        "한식": ["국밥", "육개장", "비빔밥"],
        "중식": ["짜장면", "짬뽕", "탕수육"],
        "일식": ["라멘", "우동", "초밥"]
    ]

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectButton: UIButton! // 스토리보드에서 버튼 연결

    var imageViews: [UIImageView] = []

    // 제목 라벨
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리 선택"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground

        // 제목 추가
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        pickerView.delegate = self
        pickerView.dataSource = self

        setupImageViews()
        updateImages(for: categories[0]) // 초기값
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 버튼 스타일 커스터마이징
        selectButton.layer.cornerRadius = 10
        selectButton.backgroundColor = .systemOrange
        selectButton.setTitleColor(.white, for: .normal)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategory = categories[row]
        updateImages(for: selectedCategory)
    }

    // 카드형 이미지 뷰 구성
    func setupImageViews() {
        for i in 0..<3 {
            let container = UIView()
            container.layer.cornerRadius = 10
            container.layer.shadowColor = UIColor.black.cgColor
            container.layer.shadowOpacity = 0.1
            container.layer.shadowOffset = CGSize(width: 0, height: 2)
            container.layer.shadowRadius = 4
            container.backgroundColor = .white
            container.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(container)

            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(imageView)
            imageViews.append(imageView)

            NSLayoutConstraint.activate([
                container.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: CGFloat(20 + (i * 140))),
                container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                container.widthAnchor.constraint(equalToConstant: 320),
                container.heightAnchor.constraint(equalToConstant: 120),

                imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9),
                imageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.9),
            ])
        }
    }

    func updateImages(for category: String) {
        guard let imageNames = images[category] else { return }
        for (i, imageView) in imageViews.enumerated() {
            imageView.image = UIImage(named: imageNames[i])
        }
    }

    @IBAction func selectCategoryTapped(_ sender: UIButton) {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedCategory = categories[selectedRow]

        let menuListVC = storyboard?.instantiateViewController(withIdentifier: "MenuListViewController") as! MenuListViewController
        menuListVC.selectedCategory = selectedCategory
        navigationController?.pushViewController(menuListVC, animated: true)
    }
}
