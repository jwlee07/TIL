# URL

## Url Components

```swift
/*
 http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
 */

var components = URLComponents()
components.scheme = "http"
print(components)
components.user = "username"
print(components)
components.password = "password"
print(components)
components.host = "www.example.com"
print(components)
components.port = 80
print(components)
// path의 경우에는 다른 것들과 달리 /로 시작해야 함
components.path = "/index.html"
print(components)
components.query = "key1=value1&key2=value2"
print(components)
components.fragment = "myFragment"
print(components)

// query만 교체하기
var comp = URLComponents(string: "http://www.example.com/index.html?key1=value1#frag")
comp?.queryItems = [
  URLQueryItem(name: "name", value: "tory"),
  URLQueryItem(name: "breed", value: "poodle"),
  URLQueryItem(name: "age", value: "5"),
]
print(comp?.url?.absoluteString ?? "")
```

## URL Encoding

```swift
 // 영어 주소
let urlStringE = "https://search.naver.com/search.naver?query=swift"
print("영문 주소 변환 :", URL(string: urlStringE) ?? "Nil")


// 한글 주소
let urlStringK = "https://search.naver.com/search.naver?query=한글"
print(URL(string: urlStringK) ?? "Wrong URL")


// Percent Encoding
let str = "https://search.naver.com/search.naver?query=한글"
let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
let convertedURL = URL(string: queryEncodedStr)!
print("Encoded 한글 :", convertedURL)  // %ED%95%9C%EA%B8%80
```

## URL Session

```
- 네트워크 데이터 전송 작업에 관련된 클래스 그룹을 조정하는 객체
- 비동기 방식으로 Data, Download, Upload, Stream 4가지 유형의 작업 지원
- SessionConfiguration에 의해 대부분의 기능과 동작 방식 결정 (shared, default 등)
- ComplectionHandler 또는 Delegate 방식 택일
```

### 현재 우주정거장 사람 정보 

```swift
let astronauts = "http://api.open-notify.org/astros.json"
let apiURL = URL(string: astronauts)!

struct Astronaut {
  let craft: String
  let name: String
}

let dataTask = URLSession.shared.dataTask(with: apiURL) { data, response, error in
  guard error == nil else { return print(error!)}
  guard let response = response as? HTTPURLResponse,
    (200..<400).contains(response.statusCode)
    else { return print ("Invalid responsed")}
  guard let data = data else { return }
  
  guard let jsonObjects = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else { return }
  guard (jsonObjects["message"] as? String) == "success",
  let people = jsonObjects["people"] as? [[String:String]],
  let peopleCount = jsonObjects["number"] as? Int
  else { return print ("parsing success")}
  
  print ("총 인원은 \(peopleCount)명 입니다.")
  people.compactMap {
    guard let craft = $0["craft"], let name = $0["name"] else { return nil }
    return Astronaut(craft: craft, name: name)
  }.forEach {
    print ($0)
  }
}
dataTask.resume()
```

## URL Session Configuration

```
- Shared: 별도의 구성 객체나 Delegate를 사용하지 않는 싱글톤 객체. 간단한 기본 설정으로 충분한 경우 사용
- Default: 기본 세션. 캐시, 쿠키 등을 디스크에 기록해두었다가 이후 활용
- Ephemeral: 임시 세션. 캐시, 로그인 정보 등을 메모리에만 기록하고 있다가 세션 종료 시 제거
- Background: 백그라운드 세션. 앱이 실행 중이지 않은 상태에서도 데이터 전송이 필요한 경우
```

```swift
_ = URLSession.shared
_ = URLSessionConfiguration.default
_ = URLSessionConfiguration.ephemeral
_ = URLSessionConfiguration.background(withIdentifier: "kr.giftbot.example.backgroundConfig")


// 세션 설정
let sessionConfig = URLSessionConfiguration.default

// wifi만 가능
sessionConfig.allowsCellularAccess = false

// 타임아웃 대기시간
sessionConfig.timeoutIntervalForRequest = 20

// 캐시 처리 정책
sessionConfig.requestCachePolicy = .returnCacheDataElseLoad

// 연결 실패 시 즉각 실패를 반환할 것인지 연결을 더 기다릴 것인지
sessionConfig.waitsForConnectivity = true

// 캐시 설정
sessionConfig.urlCache = URLCache.shared




// * 주의 *
// URLSession 생성 시 Configuration의 값을 복사하는 것이므로 이후의 변경 사항은 반영되지 않음
let defaultSession = URLSession(configuration: sessionConfig)
defaultSession.dataTask(with: apiURL) { (_, _, _) in }

```