# JSON (Javascript Object Notation)

```
- Javascript 언어로 부터 파생 
- 프로그래밍 언어와 플랫폼 간 독립접이고 가벼워서 XML 방식을 대체하여 현재 거의 표준으로 사용되고 있는 데이터 교환 형식
- 두 개의 구조를 기본으로 가짐
	- 'Name : Value' 형태의 쌍을 이루는 콜렉션 타입. 각 언어에서 Hash table, Dictionary 등으로 구현 
	- 값들의 순서화된 리스트, 대부분의 언어들에서 Array, Vector, List 또는 Sequence로 구현
- XML에 비해 기능이 적고 구조가 단순하여 파싱이 쉽고 빠르며 적은 용량으로 저장 가능 따라서 사람이 읽고 쓰는 것뿐 아니라 기계가 분석하고 생성하는 것에도 (상대적으로) 더 용이
- contents type은 application/json이며, 파일 확장자는 .json, 기본 인코딩은 UTF-8을 사용
```

## JSON Format Example

![JSON_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/JSON/JSON_1.png)

## JSON vs XML

![JSON_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/JSON/JSON_2.png)

## JSON vs XML

![JSON_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/JSON/JSON_3.png)

## JSON in Swift

![JSON_4](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/JSON/JSON_4.png)

## JSON Example Code

```swift
let jsonData1 = """
{
  "greeting": "hello world",
  "foo": "bar",
  "iOS": "Swift"
}
""".data(using: .utf8)!

do {
  if let json = try JSONSerialization.jsonObject(with: jsonData1) as? [String: String], // datetype 값 변환 시도
    let greeting = json["greeting"],
    let foo = json["foo"],
    let iOS = json["iOS"] {
    print(greeting)
    print(foo)
    print(iOS)
  }
} catch {
  print(error)
}
```

-----

```swift
let jsonData2 = """
{
  "greeting": "hello world",
  "iOS": true,
  "SwiftVersion": 5
}
""".data(using: .utf8)!

if let json = try? JSONSerialization.jsonObject(with: jsonData2) as? [String: Any],
  // value의 자료타입이 Any기 때문에 각각 타입캐스팅을 해줘야 한다.
  let greeting = json["greeting"] as? String,
  let iOS = json["iOS"] as? Bool,
  let version = json["SwiftVersion"] as? Int {
  print(greeting)
  print(iOS)
  print(version)
}
```

-----

```swift
let jsonData3 = """
[
  {
     "postID": 1,
     "title": "JSON",
     "body": "Javascript Object Notation"
  },
  {
    "postID": 2,
    "title": "JSON 파싱",
    "body": "JSONSerialization을 이용한 방법"
  }
]
""".data(using: .utf8)!

struct Post {
  let postID: Int
  let title: String
  let body: String
}

if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonData3) as? [[String: Any]] {
  for json in jsonObjects {
    if let postID = json["postID"] as? Int,
      let title = json["title"] as? String,
      let body = json["body"] as? String {
      let post = Post(postID: postID, title: title, body: body)
      print(post)
    }
  }
}
```

-----

```swift
let userJSONData = """
{
  "users": [
    {
      "id": 1,
      "first_name": "Robert",
      "last_name": "Schwartz",
      "email": "rob23@gmail.com"
    },
    {
      "id": 2,
      "first_name": "Lucy",
      "last_name": "Ballmer",
      "email": "lucyb56@gmail.com"
    },
  ]
}
""".data(using: .utf8)!

struct User {
  let id: Int
  let firstName: String
  let lastName: String
  let email: String

  init?(from json: [String: Any]) {
    guard let id = json["id"] as? Int,
      let firstName = json["first_name"] as? String,
      let lastName = json["last_name"] as? String,
      let email = json["email"] as? String
      else { print("Parsing error"); return nil }

    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
  }
}

func answer(jsonData: Data) {
  guard let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
    let userList = json["users"] as? [[String: Any]]
    else { return }

  let users: [User] = userList.compactMap { User(from: $0) }
  users.forEach { print($0) }
}

answer(jsonData: userJSONData)
```