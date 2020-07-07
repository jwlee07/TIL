# Codable

* 부호화 (Encoding)

```
- 정보의 형태나 형식을 표준화, 보안, 처리 속도 향상, 저장 공간 절약 등을 위해서 목적에 맞는 다른 형태나 형식으로 변환하는 처리 혹은 그 처리 방식.
- Encoder : 인코딩을 수행하는 장치나 회로, 컴퓨터 소프트웨어, 알고리즘
- A type that can encode values into a native format for external representation.
```

* 복호화 (Decoding)

```
- Encoding (부호화)된 대상을 원래의 형태로 되돌리는 일
- 예를 들어, 압축 파일을 다시 풀거나 암호화된 내용을 원래 내용으로 되돌리는 일
- A type that can decode values from a native format into in-memory representations.
```

![Codable_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Codable/Codable_1.png)

## Encode & Decode

![Codable_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Codable/Codable_2.png)

## Built-in Decoder / Encoder

![Codable_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Codable/Codable_3.png)

## Use Encoder

```swift
struct MacBook: Codable {
let model: String
let modelYear: Int
let display: Int
}
)
let macBook = MacBook(
model: "MacBook Pro", modelYear: 2020, display: 16
let encoder = JSONEncoder()
let encodedData = try! encoder.encode(macBook)
```

## Use Decoder

```swift
let jsonData = """
{
"model": "MacBook Pro",
"modelYear": 2020,
"display": 16,
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let decodedData = try! decoder.decode(
MacBook.self, from: jsonData
)
print(type(of: decodedData))
```

## Basic

```swift
let jsonData = """
{
}
""".data(using: .utf8)!
 
"age": 3,
 "name": "Tory"
 
let dog = try? JSONDecoder().decode(Dog.self, from: jsonData)
```

## Decode Manually

```swift
struct Dog: Decodable {
let age: Int
let name: String

	private enum CodingKeys: String, CodingKey {
	case age
	case name
	}
	
	init(from decoder: Decoder) throws {
		let values: try de
	}
}
```

## Change Key Names

```swift
import Foundation

let jsonData = """
{
  "user_name": "James",
  "user_email": "abc@xyz.com",
  "gender": "male",
}
""".data(using: .utf8)!


struct User: Decodable {
  let name: String
  let email: String
  let gender: String
  
  private enum CodingKeys: String, CodingKey {
    case name = "user_name"
    case email = "user_email"
    case gender
  }
}


let decoder = JSONDecoder()
let user = try decoder.decode(User.self, from: jsonData)
print(user)
```

## Nested Codable 

```swift
import Foundation

let jsonData = """
{
  "message": "success",
  "number": 3,
  "people": [
    { "craft": "ISS", "name": "Anton Shkaplerov" },
    { "craft": "ISS", "name": "Scott Tingle" },
    { "craft": "ISS", "name": "Norishige Kanai" },
  ]
}
""".data(using: .utf8)!

// 개별적으로 Codable을 적용하는 것과 동일
//[
//  { "craft": "ISS", "name": "Anton Shkaplerov" },
//  { "craft": "ISS", "name": "Scott Tingle" },
//  { "craft": "ISS", "name": "Norishige Kanai" },
//]

struct Astronauts: Decodable {
  let message: String
  let number: Int
  let people: [Person]
  
  struct Person: Decodable {
    let name: String
  }
}

do {
  let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonData)
  print(astronauts.message)
  print(astronauts.number)
  astronauts.people.forEach { print($0)}
} catch {
  print(error.localizedDescription)
}
```

## Nested Keys

```swift
import Foundation


let jsonData = """
[
{
  "latitude": 30.0,
  "longitude": 40.0,
  "additionalInfo": {
    "elevation": 50.0,
  }
},
{
  "latitude": 60.0,
  "longitude": 120.0,
  "additionalInfo": {
    "elevation": 20.0
  }
}
]
""".data(using: .utf8)!


struct Coordinate {
  var latitude: Double
  var longitude: Double
  var elevation: Double

  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
    case additionalInfo
  }
  enum AdditionalInfoKeys: String, CodingKey {
    case elevation
  }
}


extension Coordinate: Decodable {
  init(from decoder: Decoder) throws {
    let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
    latitude = try keyedContainer.decode(Double.self, forKey: .latitude)
    longitude = try keyedContainer.decode(Double.self, forKey: .longitude)
    
    let additionalInfo = try keyedContainer.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
  }
}


extension Coordinate: Encodable {
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(latitude, forKey: .latitude)
    try container.encode(longitude, forKey: .longitude)

    var additionalInfo = container.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    try additionalInfo.encode(elevation, forKey: .elevation)
  }
}


do {
  let coordinates = try JSONDecoder().decode([Coordinate].self, from: jsonData)
  coordinates.forEach { print($0) }
} catch {
  print(error.localizedDescription)
}`
```

## Container Protocols

```
- KeyedContainer : 딕셔너리 타입의 데이터에 사용 
- UnkeyedContainer : 배열 타입의 데이터에 사용 
- SingleValueContainer : 단일 값을 가진 데이터에 사용
```

## Encoding Error

```swift
/// An error that occurs during the encoding of a value.
public enum EncodingError : Error {
/// 주어진 값으로 인코딩을 하지 못할 때
case invalidValue(Any, EncodingError.Context)
}
```

## Decoding Error

```swift
/// An error that occurs during the decoding of a value.
public enum DecodingError : Error {
/// 프로퍼티 타입 미스매치
case typeMismatch(Any.Type, DecodingError.Context)
/// 디코딩할 데이터의 키에 해당하는 Value 가 없을 경우
case valueNotFound(Any.Type, DecodingError.Context)]
/// 디코딩할 데이터에 지정한 키가 없는 경우
case keyNotFound(CodingKey, DecodingError.Context)
/// 데이터가 망가졌을 경우
case dataCorrupted(DecodingError.Context)
}
```
