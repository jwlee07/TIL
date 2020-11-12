# Build Configuration 

## Target

- Xcode에서 Build를 실행하여 생성되는 최종 제품(End Product) 입니다.
- App, FrameWork, Unit Test 번들 등이 될수가 있다.
- Target은 빌드 할 제품(Product)를 지정하며 Project 또는 workspace안에 있는 파일 set에서, product를 build하기 위한 instructions(Build Settings, Build Phases)을 포함합니다.

- Target level에서 다른 설정을 지정함으로써 Project Setting을 Override할 수 있습니다.

특징.

```
- 프로젝트에는 하나 이상의 Target이 포함될 수 있으며, 각 Target은 하나의 제품(One Product)를 생성합니다.
- Target이 생성하는 제품이, 또 다른 Target과 관련될 수 있습니다.
```

## Porject

- Xcode Prject는 모든 파일, 리소스, 하나 이상의 software를 빌드하는데 필요한 정보의 repo(저장소) 입니다.

- Xcode 프로젝트 파일에는 아래 정보를 포함합니다.

```
- 소스파일에 대한 참조(reference)
    - 헤더파일 및 구현파일을 포함한 소스코드
    - Libraries와 framworks, internal 그리고 external Resource files
    - 이미지 파일
    - interface Bilder(nib) 파일
```

## Build Settings

- Build Setting은 product 빌드 프로세스의 특정 측면을 수행하는 방법에 대한 정보가 들어있다. ex.Xcode가 컴파일러에 전달하는 옵션을 지정할 수 있습니다.
