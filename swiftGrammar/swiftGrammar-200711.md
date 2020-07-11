# NETWORK

## URI, URL, URN

![NETWORK_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_1.png)

### URI

```
- 인터넷의 자원을 유일하게 식별하기 위한 통합 자원 식별자
- 절대적 경로와 상대적 경로를 모두 포함하는 URL 과 URN 의 SuperSet
```

![NETWORK_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_2.png)

### URL

```
- 어떤 자원의 위치에 대한 절대경로값을 지닌 문자열
- 어떤 특정 주소 또는 파일 리소스에 접근하기 위한 주소값으로 흔히 HTTP로 시작하는 웹 주소로 인식하는 경우가 많지만, URL의 한 형태에 해당하는 것으로 컴퓨터 네트워크상의 자원을 모두 나타낼 수 있음
```

![NETWORK_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_3.png)

### URN

```
- 위치에 독립적이고, 지속되는 형태의 자원을 가르키기 위한 유일한 식별자
- IETF에서 표준 규격을 업데이트
```

![NETWORK_4](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_4.png)

### URL vs URN

![NETWORK_5](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_5.png)

## Byte Ordering

```
- 시스템이 내부적으로 데이터를 저장하고 표현하는 순서
- CPU 벤더에 따라 바이트 단위로 데이터를 받아들이고 메모리에 저장하는 순서가 다른 데서 기인 Big Endian(IBM, Motorola ...) / Little Endian(Intel, AMD) 그 외도 있으나 많이 사용되지 않음
```

### Big Endian

```
- Network Ordering 이라고도 함
- 데이터를 상위 바이트로부터 낮은 메모리 주소에 저장하는 형태
```

![NETWORK_6](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_6.png)

### Little Endian

```
- Host Ordering 이라고도 하며, iPhone도 여기에 해당
- 데이터를 하위 바이트로부터 낮은 메모리 주소에 저장
```

![NETWORK_7](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_7.png)

### Resolution

* Endian 통일
* 
```
- 모든 시스템이 저장하는 방식을 통일시키기 어려운 상황이므로 모든 프로그램이 네트워크 전송 시 약속된 공통의 Endian을 사용하고 수신 특에서 변환
```

* Byte 단위 전송
* 
```
- Endian 문제는 Byte 단위로 저장할 때 순서의 차이에 의해 발생하므로, 애초에 1Byte 단위로 데이터를 보내면 바이트 순서에 구애받지 않고 통신 가능
```

## Internet Protocol Suite

### TCP/IP Protocol Suite

```
인터넷 프로토콜 스위트(Protocol Suite)는 인터넷 네트워크에 쓰이는 프로토콜의 모음 TCP/IP가 가장 많이 사용되기에 TCP/IP 프로토콜 스위트 또는 프로토콜 스택이라고도 함 HTTP, FTP, Telnet 등이 TCP/IP기반

- TCP (Transmission Control Protocol) : 패킷 전송 여부와 순서 보장의 특징
- IP (Internet Protocol) : 비 신뢰성과 비 연결성의 특징
```

![NETWORK_8](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_8.png)

* 1계층 (Physical)
```
- 실제 데이터 패킷 전송을 책임진다.
```

* 2계층 (Network)
```
- 데이터가 어떤 라우터들을 거쳐 목적지로 전달될 지에 대한 전달 경로를 정의한다.
- IP 프로토콜은 비연결지향적이며, 신뢰할 수 없는 특성을 가지므로 신뢰성 확보를 위해 TCP가 필요
```

* 3계층 (Transport)
```
- 데이터 송수신 방식을 결정한다.
- TCP : 연결지향형 서비스, 메세지 전달 보장 및 순서 보장
- UDP : 비연결형 서비스, 메세지 전달 여부나 순서 보장이 되지 않는 대신 TCP 보다 빠른 속도
```

* 4계층 (Applicatrion)
```
데이터를 어떤 서비스를 활용해 주고 받을 것인지 정의한다.(HTTP, FTP 등)
```

### Protocol Interface

![NETWORK_9](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_9.png)

```
각 계층을 타고 올라가거나 내려갈 시 헤더에 추가가 된다.
```

![NETWORK_10](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_10.png)

## HTTP

* 애플리케이션 계층 중 하나의 프로토콜이다.
* 80port 사용

### List of Port

* 국제 인터넷 주소 관리 기구 (ICANN) 에서 포트번호를 다음과 같이 세 구간으로 구분

```
- Well-Known Port
	- 0번 ~ 1023번
	- ICANN에 의해 통제되는 포트

- Registered Port
	- 1024번 ~ 49151번
	- 중복 방지를 위해 ICANN에 등록은 되어 있으나 미통제

- Dynamic / Private Port
	- 49152번 ~ 65535번
	- 어떤 프로세스에서도 사용 가능
```

![NETWORK_11](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_11.png)

### HTTP Request

```
- Method : Get, Post, Delete 등
- URI : 일반적으로 URL 주소 형태
```

![NETWORK_12](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_12.png)

### HTTP Response Status Code

```
- 1xx : 정보성 (Informational)
- 2xx : 성공 (Success)
- 3xx : 전환 (Redirection)
- 4xx : 클라이언트 에러 (Client errors)
- 5xx : 서버 에러 (Server errors)
```

## REST API

```
- REST : Representational State Transfer
- 자원을 정의하고 자원에 대한 주소를 지정하는 방법 등을 의미하는 네트워크 아키텍처 원리의 모음
```

### Main Components

```
- 구성요소
	- 메서드 : 자원에 대한 행위 정의 (GET, POST 등)
	- 리소스 : 자원을 정의 (URI)
	- 메세지 : 자원에 대한 행위의 내용을 정의 (일반적으로는 JSON)
```

```swift
HTTP POST, http://myweb/users/
{
	"users":{
			"name":"someName"
	}
}
```

### Method

* HTTP의 여러 메서드 중 CRUD에 해당하는 4가지 메서드만 사용

```
- POST (Create)
	- URI와 관련된 자원 생성 / 작업 수행
	- 다른 메서드들과 달리 URI에 특정 자원을 지정하는 ID가 없음

- GET (Read)
	- 지정 URI에 해당하는 자원을 조회하고 가져오기 위함

- PUT / PATCH (Update)
	- 지정 URI에 해당하는 자원 수정
	- PUT : 전체 내용 수정
	- PATCH : 일부 항목 수정

- DELETE (Delete)
	- 지정 URI에 해당하는 자원 삭제
```

### REST API Example

![NETWORK_13](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Network/NETWORK_13.png)

