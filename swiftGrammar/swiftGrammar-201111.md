# KSecClass

- Apple Developer 설명

```
- 값이 항목의 클래스인 사전 키.

- 키 체인 항목은 암호, 암호화 키 및 인증서와 같이 보유하고있는 데이터의 종류에 따라 다양한 클래스로 제공됩니다. 항목의 클래스는 적용되는 속성을 지정하고 시스템이 디스크에서 데이터를 암호화해야하는지 여부를 결정할 수 있도록합니다. 예를 들어 암호에는 암호화가 필요하지만 인증서는 비밀이 아니기 때문에 그렇지 않습니다.

- 여기에 나열된 키와 해당 값 중 하나를 사용 하여 사전 에 키 / 값 쌍을 배치하여 함수 호출로 생성하는 새 항목의 클래스를 지정합니다 .SecItemAdd(_:_:)attributes

- 나중에,이 같은 한 쌍의 사용 query의 하나의 항목을 검색 할 때 사전 , 또는 기능한다.SecItemCopyMatching(_:_:)SecItemUpdate(_:_:)SecItemDelete(_:)
```

- 구현 방법
    - Class 형태로 사용하게 된다.

```swift
    class func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }
```
- save
    - 

```swift
    class func load(key: String) -> Data? {

        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject? = nil

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
```

```swift
    final private func delete(key:String, data:Data) {
        let query:[String : Any] = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data
        ]

        SecItemDelete(query as CFDictionary)
    }

```

```swift
extension Data {

    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }

    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.load(as: T.self) }
    }
}
```

- 추가설명.
```
# Generic

- Generic는 Swift의 가장 강력한 도구 중 하나.
- Swift 표준 라이브러리 대부분은 Generic로 작성되어 있다.
- 
```

- 사용 방법

```swift
let int: Int = 555
let data = Data(from: int)
let status = KeyChain.save(key: "MyNumber", data: data)
print("status: ", status)

if let receivedData = KeyChain.load(key: "MyNumber") {
    let result = receivedData.to(type: Int.self)
    print("result: ", result)
}
```

참고.
https://stackoverflow.com/users/1155354/kosuke-ogawa