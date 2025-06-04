import UIKit

class MenuListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var selectedCategory: String?

    // 메뉴 데이터
    let lunchMenu: [String: [Menu]] = [
        "한식": [
            Menu(name: "국밥", price: 5000, description: "뜨끈한 국밥 한 그릇"),
            Menu(name: "육개장", price: 6000, description: "얼큰한 육개장"),
            Menu(name: "비빔밥", price: 5500, description: "다채로운 비빔밥")
        ],
        "중식": [
            Menu(name: "짜장면", price: 4500, description: "달콤한 짜장 소스"),
            Menu(name: "짬뽕", price: 5000, description: "얼큰한 짬뽕"),
            Menu(name: "탕수육", price: 7000, description: "바삭한 탕수육")
        ],
        "일식": [
            Menu(name: "라멘", price: 6500, description: "일본식 돈코츠 라멘"),
            Menu(name: "우동", price: 5000, description: "가쓰오부시 향 가득 우동"),
            Menu(name: "초밥", price: 7000, description: "신선한 초밥 세트")
        ]
    ]

    var menus: [Menu] {
        if let category = selectedCategory {
            return lunchMenu[category] ?? []
        }
        return []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedCategory ?? "메뉴"
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 커스텀 셀로 캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let menu = menus[indexPath.row]

        // 커스텀 셀에 데이터 바인딩
        cell.titleLabel.text = menu.name
        cell.priceLabel.text = "\(menu.price)원"
        cell.menuImageView.image = UIImage(named: menu.name) // 이미지 이름이 메뉴명과 같을 경우

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuDetailVC = storyboard?.instantiateViewController(withIdentifier: "MenuDetailViewController") as! MenuDetailViewController
        menuDetailVC.menu = menus[indexPath.row]
        navigationController?.pushViewController(menuDetailVC, animated: true)
    }
}
