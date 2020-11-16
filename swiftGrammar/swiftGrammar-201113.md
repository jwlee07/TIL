# 전처리문

- 전처리문(PREPROCESSOR STATEMENT)은 컴파일 이전에 미리 처리되는 문장을 의미합니다.
- 전처리문은 #으로 시작됩니다.


## DEBUG Or Release

- 디버그 모드 vs 릴리즈 모드

```
1. 앱을 개발하던 도중 버그가 있는데 Xcode 디버거로 찾는 것 보다 로그로 찾는게 더 빨라서 이런저런 로그를 추가 해둔다.이 로그를 남기는 코드는 디버깅하는데 도움을 주며 앱이 정상 동작하는지 판단하는데도 중요한 역할을 한다.

2. 하지만 앱을 배포 시 해당 로그들이 뿌려지는걸 원치 않는다.
```

```swift
#if DEBUG
    print ("DEBUG에서만 사용될 코드")
#elseif RELEASE
    print ("Release에서만 사용될 코드")
#endif
```

## OS 구분

```swift
#if os(iOS)
  print("ios에서만 할 코드")
#elseif os(macOS)
  print("macOS에서만 할 코드")
#elseif os(watchOS)
  print("wathOS에서만 할 코드")
#endif
```

-----

# FileManager를 이용해 파일/폴더 만들기

- 파일 및 디렉터리와 관련된 기본적인 작업 중 일부는 파일 시스템을 생성하고 파일 시스템 중심으로 이동.
- 앱이 작업을 수행하는데 필요한 파일 시스템 구조를 빌드하는 방법.

## Creating Directories

- 사용자 정의 디렉터리를 만들 시 NSFileManager의 메소드 사용
- 프로세스는 권한을 가진 곳이면, 어디에서나 디렉토리를 생성
- 경로를 만든 후 NSURL 또는 NSString 객체를 다음 지정
- NSFileManager메소드는 단순성 때문에 새 디렉토리를 만드는데 선호되는 방법

## Creating New Files

- 파일을 만들 시, 파일 시스템의 파일에 대한 레코드를 만든 후 파일에 내용을 채우는 두 파트가 있다.해당 작업은 고급인터페이스가 두 작업을 동시에 수행
- 대게 파일을 NSData 또는 NSString 객체의 내용으로 채운 다음 파일을 닫음.

## Code

### 파일 생성

```swift
let fileManager = FileManager.default
```

- FileManager의 싱글톤 인스턴스를 생성

```swift
let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
```

- urls : 요청된 도메인에서 지정된 공통 디렉토리에 대한 URL 배열을 리턴해주는 메서드
- 첫번째 파라미터 : 검색 경로 디렉터리
- 두번째 파라미터 : Domain을 나타내는 값

```swift
let fileURL = documentsURL.appendingPathComponent("JinWook의 파일.확장자")

let myTextString = NSString(string: "HELLO WORLD")
try? myTextString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8.rawValue)
```

- 완료 후 Files 앱에 추가가된다.

### 파일 다운로드

```swift
let fileURL = documentsURL.appendingPathComponent((nameUrl?.lastPathComponent)!)
```

- 보통 가장 마지막에 "파일 이름"이 들어가기 때문에 lastPathComponent 사용.
- URL String Type를 URL Type로 변경해야 한다.

### 디렉터리 생성

```swift
let filePath =  documentsURL.appendingPathComponent("JinWook")
  if !fileManager.fileExists(atPath: filePath.path) {
    do {
      try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
    } catch {
      NSLog("Couldn't create document directory")
    }
  }
```





