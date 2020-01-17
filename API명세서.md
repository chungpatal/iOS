

## API

- 장소 리스트 가져오기 **GET** `/place/list/:categoryIdx`

  - 모아보기 = categoryIdx : 0

  - grade: 2-양호, 1-주의, 0-경고

  - 응답 Body (높은 등급순)

    - ```javascript
      {
          "message": "Success",
          "data": [
              {
                  "place_idx": 13,
                  "name": "창강빌딩",
                  "pk": "11440-8864",
                  "info": "도화동/0022/0000",
                  "grade": 2
              }, ...
          ]
      }
      ```

- 장소 검색 **GET** `/place/search?q={q}`

  - 검색 기준: name, address, legal_name, pk, num

  - 응답 Body

    - ```javascript
      {
          "message": "Success",
          "data": [
              {
                  "place_idx": 13,
                  "name": "창강빌딩",
                  "pk": "11440-8864",
                  "info": "도화동/0022/0000",
                  "grade": 2
              }, ...
          ]
      }
      ```

- 장소 상세 보기 **GET** `/place/detail/:placeIdx`

  - 응답 Body

    - ```javascript
      {
          "message": "Success",
          "data": {
              "place_idx": 3,
              "name": "우대메디칼",
              "address": "서울 마포구 만리재로 27",
              "grade": 1,
              "legal_name": "신공덕동",
              "num": "0015/0019",
              "use_idx": 4,
              "pk": "11440-8191",
              "long": "126.9542563",
              "lat": "37.5447229",
              "detail_info": [
                  {
                      "category_idx": 3,
                      "grade": 1,
                      "detail": "자체 점검 대상 여부: Y\n대형 화재 취약 대상 여부: \n특별 피난 계단 수: \n피난 계단 수: "
                  },
                  {
                      "category_idx": 4,
                      "grade": 2,
                      "detail": "최종 검사일: 20190130\n검사일: 20190130\n검사 결과명: 적합"
                  },
                  {
                      "category_idx": 5,
                      "grade": 2,
                      "detail": "최종 점검 일: 20190922\n결과 내용: 정상\n점검일: 20190922\n점검 결과: 합격"
                  },
                  {
                      "category_idx": 6,
                      "grade": 1,
                      "detail": "유효 기간 시작일: 20171113\n유효 기간 만료일: 20181112\n최종 검사일: 20181227\n최종 검사 종류: 정기\n최종 검사 결과: 조건부합격\n검사 일자: 20171214\n검사 종류: 정기\n합격 유무: 합격"
                  }
              ]
          }
      }
      ```

- 장소 추가 **POST** `/place`

  - 요청 Body

    - ```javascript
      {
        "name": "새 장소 이름",
        "address": "주소₩~~~",
        "legal_name": "공덕동",
        "num": "20131/12304",
        "pk": "11440-100246059",
        "use_idx": 3,
        "detail_info": [
          {
            "category_idx": 1,
            "grade": 0,
            "detail": "DASDSADASDSAdsadsa"
          },
          {
            "category_idx": 3,
            "grade": 0,
            "detail": "DASDSADASDSAdsadsa"
          }
        ]
      }
      ```

  - 응답 Body

    - ```javascript
      {
          "message": "Success",
          "data": {}
      }
      ```

- 장소 수정 **PUT** `/place`

  - 요청 Body

    - ```javascript
      {
        "place_idx": 3
        "name": "고칠 장소 이름",
        "address": "주소₩~~~",
        "legal_name": "공덕동",
        "num": "20131/12304",
        "pk": "11440-100246059",
        "use_idx": 3,
        "detail_info": [
          {
            "category_idx": 1,
            "grade": 0,
            "detail": "DASDSADASDSAdsadsa"
          }
        ]
      }
      ```

  - 응답 Body

    - ```javascript
      {
          "message": "Success",
          "data": {}
      }
      ```