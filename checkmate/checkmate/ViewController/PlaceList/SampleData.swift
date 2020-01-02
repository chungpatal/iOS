let placeCategoryDetail1 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190604
    상태 평가 등급: 양호
    점검 진단 결과:
    본 건물은 안정적인 거동을 취하고 있으며 유지관리 상태 또한 양호한 것으로 판단됨. 슬래브의 균열에 대한 보수가 필요함. 항상 건물은 준공 당시의 형태를 유지하여야 하며 만약 용도변경 및 구조변경이 이루어질 시에는 정밀안전진단을 실시하여 안정성을 확인 받은 후 진행되어야 함.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .safe, detail: """
    점검 결과 의견:
    창겅발딩 건축물의 건축시설, 구조안전, 전기설비. 기계설비 등은 사용승인 도면과 동일한 상태로 양호하게 유지 관리되고 있음.
    """),
    DetailInfo(categoryIdx: .fire, grade: .safe, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180323
    결과 내용: 정상
    점검일: 20180323
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20181018
    유효 기간 만료일: 20191017
    최종 검사일: 20181121
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20181121
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail1 = PlaceDetail(placeIdx: 13, name: "창강빌딩", address: "서울특별시 마포구 마포대로 86 (도화동)", totalGrade: .safe, legalName: "도화동", num: "0022/0000", useIdx: 8, pk: "11440-8864", detailInfo: placeCategoryDetail1)

let placeCategoryDetail2 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    - 신화빌딩은 1984년 건축허가를 득한 후 1986년 준공된 철근콘크리트(플랫슬래브)구조로 신축되어, 현재까지 유사용도로 사용하고 있으며, 옥상조경은 바닥구조의 안전성문제로 제거된 상태이고, 그 밖에 대지, 건축물의 높이 및 형태는 준공이후 특이할 만한 변경사항 없이 유지되고 있음.

    - 화재안전과 건축설비 부분은 지속적인 유지보수 및 정비를 통하여 양호하게 관리되고 있으며, 소방, 승강기, 전기, 가스, 보일러 등과 관련한 부분들은 타 법령에서 정한 기준대로 정기적인 점검을 실시하고 있음.

    - 그 밖에 승강기, 전기, 가스 등은 타 법령에서 정한 기준대로 정기적인 점검을 실시하고, 주요 건축설비는 지속적으로 유지보수를 통하여 성능 및 기능면에서 비교적 양호하게 관리되고 있음.

    - 구조안전 점검결과, 전 층의 플랫슬래브에서 허용한계를 초과하는 처짐이 발생하여 수차례 정밀안전진단을 실시하고, 그 결과에 따라 일부 슬래브에서 탄소섬유시트와 H-Beam으로 보강된 이력이 있으나, 집합소유건축물의 특성상 전 층에 대한 보강은 이루어지지 못하고 있는 실정임.

    - 전에 실시한 정밀안전진단의 결과는 다음과 같으므로, 건축물의 안전성 확보 및 위험요소 제거를 위하여 적극적인 조치가 이루어져야 할 것으로 판단됨.
    1) 옥상층은 일반인의 출입을 통제하고, 관리자의 점검용으로만 사용
    2) 지상층 플랫슬래브는 H-Beam 신설보강 혹은 텐션보강요
    3) 각 층의 사용하중이 기준치를 초과하지 않도록 중량물의 적재 금지
    4) 사용하중이 큰 상위 그룹군으로의 용도변경 제한
    5) 슬래브의 일부를 절단하거나 파손시키는 행위금지
    6) 처짐에 대한 추가진행여부를 확인하기 위한 지속적인 계측관리 필요
    (현재 지속적으로 계측관리를 실시하고 있음.)
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 0
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20161228
    검사일: 20181128
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180225
    결과 내용: 정상
    점검일: 20180225
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20181023
    유효 기간 만료일: 20191022
    최종 검사일: 20181211
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20181211
    검사 종류: 정기
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail2 = PlaceDetail(placeIdx: 32, name: "마포회관", address: "서울 마포구 마포대로 19, 지하1층 3호(마포동, 신화빌딩)", totalGrade: .safe, legalName: "마포동", num: "0034/0001", useIdx: 8, pk: "11440-10557", detailInfo: placeCategoryDetail2)

let placeCategoryDetail3 = [
    DetailInfo(categoryIdx: .facility, grade: .warn, detail: """
    최종 점검 진단 종료일: 20190416
    상태 평가 등급: 보통
    점검 진단 결과:
    지하층의 경우 천정 슬래브 보수부위 재균열, 일부 슬래브 배관주위 철근노출이 조사된 상태이며, 특히 지하층 램프 천정슬래브에 전반적인 균열 및 누수 흔적 부위는 지속적인 주의 관찰이 필요할 것으로 판단되며, 지상층의 경우 일부 계단실 벽체, 세대 현관 상부 균열이 조사되었다. 본 점검에서 조사된 성능저하부위는 구조안전성에 문제가 될 만한 중대 결함사항은 없으나, 철근노출 결함은 장기 방치 시 철근 부식 및 콘크리트 추가탈락 위험이 있으므로 적절한 보수 조치 및 지속된 유지관리가 필요할 것으로 판단된다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .danger, detail: """
    점검 결과 의견:
    1988년 7월 준공된 구조안전확인 대상 건축물이며, 지속적으로 유지관리에 관심을 가지고 있는 건축물임.
    다만 건폐율, 용적률 위반부분은 조속히 현행법규에 맞도록 개선이 필요하며 오래된 건축물인 점을 감안하여 건물 내,외부 취약한 부분(지하층, 옥상바닥, 마감재료 등)을 중점적으로 유지 관리함이 필요함.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190106
    결과 내용: 정상
    점검일: 20190106
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180322
    유효 기간 만료일: 20190321
    최종 검사일: 20180322
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20180322
    검사 종류: 정밀
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail3 = PlaceDetail(placeIdx: 33, name: "고려아카데미텔", address: "서울특별시 마포구 마포대로 52 (도화동)", totalGrade: .warn, legalName: "도화동", num: "0036/0000", useIdx: 8, pk: "11440-9496", detailInfo: placeCategoryDetail3)

let placeCategoryDetail4 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .safe, detail: """
    점검 결과 의견:
    진도빌딩 건축물은 건축시설, 구조안전, 전기설비, 기계설비, 등등이 사용승인도면과 동일한 상태로 양호하게 유지, 관리되고 있음.
    """),
    DetailInfo(categoryIdx: .fire, grade: .safe, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20130121
    검사일: 20161222
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180128
    결과 내용: 정상
    점검일: 20180128
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20171207
    유효 기간 만료일: 20181206
    최종 검사일: 20180105
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20180105
    검사 종류: 정밀
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail4 = PlaceDetail(placeIdx: 34, name: "포몬스(마포점)", address: "서울 마포구 마포대로 44 진도빌딩 201호", totalGrade: .safe, legalName: "도화동", num: "0037/0000", useIdx: 8, pk: "11440-9497", detailInfo: placeCategoryDetail4)

let placeCategoryDetail5 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .danger, detail: """
    점검 결과 의견:
    육안상 건축물의 구조적 위험성은 없는 것으로 판단함
    복도등 공용공간에 대한 정리 및 점검이 지속적으로 필요
    건축물 내부 마감이 노후화 되어 향후 미관상 유지 보수 계획이 필요함
    옥상방수에 대한 유지관리 필요함
    """),
    DetailInfo(categoryIdx: .fire, grade: .safe, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20171114
    검사일: 20181026
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190309
    결과 내용: 정상
    점검일: 20190309
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180527
    유효 기간 만료일: 20190526
    최종 검사일: 20180605
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180605
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    적발일: 20171214

    """)]

let placePlaceDetail5 = PlaceDetail(placeIdx: 58, name: "일진디앤코주식회사 ", address: "서울 마포구 마포대로 45 일진빌딩", totalGrade: .warn, legalName: "도화동", num: "0050/0001", useIdx: 8, pk: "11440-9499", detailInfo: placeCategoryDetail5)

let placeCategoryDetail6 = [
    DetailInfo(categoryIdx: .facility, grade: .danger, detail: """
    최종 점검 진단 종료일: 20190520
    상태 평가 등급: B등급
    점검 진단 결과:
    “성우 빌딩” 시설물은 준공 후 약 33년 5개월이 경과된 철골·철근콘크리트조 구조물로서 주요 구조부재의 규격, 콘크리트 압축강도, 철근 배근상태, 구조 부재치수 등은 대부분 설계도면과 부합하게 시공되었으며, 탄산화 심도 측정결과 기준치이내인 평균 1.08cm 정도이며, 철근부식 확률은 0%로 열화 증상이 보이지 않음으로 분석되었고, 변위조사 결과 부동침하, 부재 처짐의 양상이 없는 양호한 상태를 보이고 있는 것으로 조사되었다.  또한, 구조체 상태를 육안 점검한 결과, 지하층 상부 슬래브에는 균열 및 누수(백태)가 다수 발생된 상태이며, 지하4층 정화조 관리층 상부슬래브와 보에는 철근노출 및 부식, 콘크리트 박리 및 박락현상 등의 열화현상이 전 구간에서 발생된 상태이므로 빠른 시일 내에 보수 및 보강이 요구된다. 또한 지하주차장 상부 보 균열, 지붕층 계단실 벽체 누수 및 페인트 탈락, 외벽 타일벽체 창호주위 균열 등의 성능저하부위는 구조적 안정성에는 문제가 없는 상태이나, 시설물의 내구성 및 기능성 확보차원에서 보수계획을 수립하여 보수함이 바람직하다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    서울특별시 마포구 도화동에 위치한 성우빌딩은 1985년 12월 6일 사용승인 후 약 30년 7개월 정도 경과하한 업무시설, 위락시설, 판매시설 용도의 지하4층, 지상16층 건축물이며, 건축법시행령 제23조의3 제1항에 의하여, 구조안전 항목의 점검을 제외한 5개 분야에 대한 세부점검을 실시하여 계량적인 평가방법에 의한 건축물 상태를 확인한 결과, 평균점수는 3.7점으로 건축물 경과 년수에 비하여 보통 수준 이상인 것으로 평가되었음.
    성우빌딩은 불특정 다수가 이용하는 업무시설로서, 방화문이나 제연설비와 같이 피난 및 방화성능 유지를 위한 지속적인 관리가 필요하며, 건물의 경과 년수가 30년 이상 지남에 따라, 외벽, 옥상, 내부 마감재 등의 노후화 및 주요설비의 성능저하가 발생될 수 있으므로, 내구성 유지를 위하여 장기적이고 체계적인 유지관리 및 보수계획 수립이 요망됨.
    또한, 대지주변 지반에 대한 정기적인 점검이 권장되고, 시설 관리자의 안전을 위하여 옥탑 피뢰침 점검을 위한 철재사다리에 대한 조속한 안전대책 수립이 요망되며, 정화조 배기구 누기차단을 위한 조치 및 배기구 연장 설치가 요망됨.
    특히, 외벽마감재가 노후화되었고, 외벽창호의 단열성능이 저하되어 있으므로, 미관향상과 에너지효율을 동시에 해결하기 위하여, LH공사에서 추진중인 ‘그린리모델링 이자지원사업’에 대한 적극적인 검토가 요망됨. (그린리모델링창조센터, http://www.greenremodeling.or.kr/ TEL : 1600-1004)
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190825
    결과 내용: 정상
    점검일: 20190825
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20171226
    유효 기간 만료일: 20181225
    최종 검사일: 20171226
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20171226
    검사 종류: 정밀
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail6 = PlaceDetail(placeIdx: 59, name: "성우빌딩", address: "서울특별시 마포구 마포대로 49 (도화동)", totalGrade: .warn, legalName: "도화동", num: "0051/0001", useIdx: 8, pk: "11440-9500", detailInfo: placeCategoryDetail6)

let placeCategoryDetail7 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190621
    상태 평가 등급: 양호
    점검 진단 결과:
    건축물의 구조는 전반적으로 양호한 것으로 판단한다. 주요 구조부재에 대한 육안점검 결과, 구조적으로 문제시될 만한 특이한 사항은 없는 상태이다. 다만, 지하주차장 및 계단실의 일부 콘크리트 구조부재에서 균열 및 누수흔적 등의 결함이 발생된 상태이며, 비 구조부재에도 균열 등의 결함이 발생된 상태이다. 관리주체는 이에 대해 적절한 유지관리계획을 수립하고, 이 계획에 따라 건축물의 사용성 및 내구성을 보전하는 차원에서 적절한 보수를 실시하는 것이 바람직하다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .safe, detail: """
    점검 결과 의견:
    다보빌딩 건축물의 건축시설, 구조안전, 전기설비, 기계설비 등은 사용승인 도면과 동일한 상태로 양호하게 유지 관리되고 있음.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20130311
    검사일: 20130311
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190623
    결과 내용: 정상
    점검일: 20190623
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20181102
    유효 기간 만료일: 20191101
    최종 검사일: 20181031
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20181031
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail7 = PlaceDetail(placeIdx: 65, name: "(재)대한불교진흥원", address: "서울특별시 마포구 마포대로 20 (마포동)", totalGrade: .safe, legalName: "마포동", num: "0140/0000", useIdx: 8, pk: "11440-10396", detailInfo: placeCategoryDetail7)

let placeCategoryDetail8 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190630
    상태 평가 등급: 양호
    점검 진단 결과:
    건축물의 구조부재에 대한 정밀육안조사를 실시한 결과 시설물의 전반적인 상태는 양호한 것으로 확인되었다. 일부 벽체, 기둥, 보, 슬래브에서 균열 및 누수흔적, 박리 등의 형태로 조사되었으며, 철골부재에 대해서 부식 및 내화페인트 탈락 등의 결함은 없는 것으로 확인되었다. 발생한 결함에 대한 주기적인 관찰 및 관리를 통해 변위를 확인하는 것이 좋겠다. 따라서 주요부재에 경미한 결함이 발생하였으나 건축.구조기능 발휘에는 지장이 없으며 내구성 증진을 위하여 일부의 보수가 필요한 상태인 양호등급으로 지정하였다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20170224
    검사일: 20170224
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190810
    결과 내용: 정상
    점검일: 20190810
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180202
    유효 기간 만료일: 20190201
    최종 검사일: 20180326
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20180326
    검사 종류: 정밀
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    시정 완료일: 20070515
    """)]

let placePlaceDetail8 = PlaceDetail(placeIdx: 67, name: "서울신용보증재단본점", address: "서울특별시 마포구 마포대로 163 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0168/0000", useIdx: 8, pk: "11440-6796", detailInfo: placeCategoryDetail8)

let placeCategoryDetail9 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190501
    상태 평가 등급: 양호
    점검 진단 결과:
    서울가든호텔은 준공 후 점검 당일까지 약 40년 정도 경과한 건축물로서 노출된 부위에 한하여 육안조사결과, 일부구간에서 미세균열과 마감재훼손, 누수흔적 및 백태가 발견되었다. 결함부위는 구조상 문제점이 없는 것으로 조사되었고, 수시로 보수 보강을 진행하고있음을 확인하였다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    베스트 웨스턴 프리미어 서울가든호텔에 대한 건축물 유지·관리 점검은 기존에 실시한 점검보고서 및 리모델링도면 등을 토대로 점검을 실시하였다. 점검결과 진단일 현재 대지항목 4.0점, 높이 및 형태 4.0점, 화재안전 3.8점, 건축설비 4.0점, 에너지 및 친환경 관리 4.0점 등 평균 4.0점으로 전반적으로 양호한 상태를 유지하고 있다. 다만 화재 발생 등 피난을 위하여 옥상광장의 출입문을 개방해 놓아야 하고 난간의 높이를 현행기준에 맞춰 안전사고를 예방하야여할 것으로 판단된다.
    구조안전 항목은 점검대상건축물이 시설물의 안전관리에 관한 특별법 상의 2종 시설물로 건축법 시행령 제23조의3 1항에 의거하여 제3호 구조안전 항목의 점검을 생략한다.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20161004
    검사일: 20180928
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180905
    결과 내용: 정상
    점검일: 20180905
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20171214
    유효 기간 만료일: 20181213
    최종 검사일: 20180206
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20180206
    검사 종류: 정밀
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    적발일: 20110630
    특이사항:
    도시경관과-13393(2011.09.06) : 2007년→1997년 발생년도 정정도시계획과이첩-6700(2011.6.23)

    """)]

let placePlaceDetail9 = PlaceDetail(placeIdx: 68, name: "서울가든호텔", address: "서울특별시 마포구 마포대로 58 (도화동)", totalGrade: .warn, legalName: "도화동", num: "0169/0001", useIdx: 7, pk: "11440-8983", detailInfo: placeCategoryDetail9)

let placeCategoryDetail10 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190612
    상태 평가 등급: 양호
    점검 진단 결과:
    본 대상 건축물의 점검 결과 용도변경 및 구조부재의 변경이나, 주변조건 변경사항은 조사되지 않았고, 그리고 육안조사 결과 계단실과,지하주차장 등에서 균열 및 누수 및 백태현상 등이 발생된 상태이다. 이를 장기간 방치 할 경우 콘크리트 구조체의 내구성 저하 및 콘크리트의 노후화를 가속시킬 수 있으므로 내구성 향상 과 유지관리 측면에서 발생한 균열 및 손상부위는 적절한 방법으로 보수가 필요한 것으로 사료되며, 또한지속적인 관리가 필요한 것으로 판단된다. 5년차 하자종결공사로 옥상도장들뜸부위 제거후 표면강화제처리시공.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20150930
    검사일: 20161206
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190423
    결과 내용: 정상
    점검일: 20190423
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180120
    유효 기간 만료일: 20190119
    최종 검사일: 20180611
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180611
    검사 종류: 정기
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail10 = PlaceDetail(placeIdx: 70, name: "마포KCC웰츠타워", address: "서울특별시 마포구 백범로 202 (신공덕동)", totalGrade: .safe, legalName: "신공덕동", num: "0171/0000", useIdx: 1, pk: "11440-100198793", detailInfo: placeCategoryDetail10)

let placeCategoryDetail11 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190628
    상태 평가 등급: 양호
    점검 진단 결과:
    · 일부 구조체 및 조적벽체에서 균열, 누수흔적 등이 조사되었으나, 이는 재료적 특성 및 환경적 요인에 의한 것으로 유지관리 차원의 보수를 통하여 사용성 및 내구성 확보할 수 있으며, 전반적으로 구조안정성에 문제가 없는 상태이다.  · 지하주차장 슬래브는 철근부식에 대한 콘크리트 박리·박락으로 지속적인 보수를 실시하고 있는 상태이다.   · 전회차 점검과 비교하여 볼 때 특이사항 없으며, 지속적인 점검을 통해 유지관리에 만전을 다하도록 한다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .safe, detail: """
    점검 결과 의견:
    삼창주택 건축물은 건축시설, 구조안전, 전기설비, 기계설비, 등이 사용승인도면과동일한 상테로 양호하게 유지관리되고 있음.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20141125
    검사일: 20170706
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190124
    결과 내용: 정상
    점검일: 20190124
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180816
    유효 기간 만료일: 20190815
    최종 검사일: 20181010
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20181010
    검사 종류: 정기
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail11 = PlaceDetail(placeIdx: 74, name: "삼창프라자빌딩", address: "서울특별시 마포구 마포대로 63-8 (도화동)", totalGrade: .safe, legalName: "도화동", num: "0173/0000", useIdx: 8, pk: "11440-9518", detailInfo: placeCategoryDetail11)

let placeCategoryDetail12 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20180313
    검사일: 20190531
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20120830
    결과 내용: 정상
    점검일: 20120830
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20180906
    유효 기간 만료일: 20190905
    최종 검사일: 20180921
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20180921
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    적발일: 20090707, 20120619
    특이사항:
    뒷편공지. 무단증축에 대한 추인허가 사항임
    시정 완료일: 20080929
    """)]

let placePlaceDetail12 = PlaceDetail(placeIdx: 79, name: "용산역전회관일구육이", address: "서울 마포구 토정로37길 47", totalGrade: .warn, legalName: "염리동", num: "0173/0021", useIdx: 8, pk: "11440-13746", detailInfo: placeCategoryDetail12)

let placeCategoryDetail13 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160623
    검사일: 20190401
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20170707
    결과 내용: 정상
    점검일: 20170707
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180216
    유효 기간 만료일: 20190215
    최종 검사일: 20180321
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180321
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    시정 완료일: 20081125
    """)]

let placePlaceDetail13 = PlaceDetail(placeIdx: 80, name: "하나프라자", address: "서울 마포구 토정로37길 41 하나프라자", totalGrade: .warn, legalName: "염리동", num: "0173/0029", useIdx: 12, pk: "11440-13747", detailInfo: placeCategoryDetail13)

let placeCategoryDetail14 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    - 전체적으로 보통 이상의 유지 관리가 되고 있음.
    - 안전상의 문제가 없음.
    - 일부 개선사항에 대한 개선이 필요함.

    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20180712
    검사일: 20190910
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20170604
    결과 내용: 정상
    점검일: 20170604
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20180630
    유효 기간 만료일: 20190629
    최종 검사일: 20180622
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20180622
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail14 = PlaceDetail(placeIdx: 85, name: "서울특별시마포구시설관리공단", address: "서울 마포구 큰우물로 61 염리 제2공영주차장 생활체육관", totalGrade: .warn, legalName: "염리동", num: "0174/0003", useIdx: 10, pk: "11440-13748", detailInfo: placeCategoryDetail14)

let placeCategoryDetail15 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160819
    검사일: 20181026
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .danger, detail: """
    최종 점검 일: 20180309
    결과 내용: 정상
    점검일: 20180309
    점검 결과: 전폐
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20180521
    유효 기간 만료일: 20190520
    최종 검사일: 20180611
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20180611
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    특이사항:
    지상3층 32.75, 지상4층 14.5를 근생으로 무단용도변경

    """)]

let placePlaceDetail15 = PlaceDetail(placeIdx: 99, name: "성진", address: "서울 마포구 도화길 27", totalGrade: .warn, legalName: "도화동", num: "0179/0003", useIdx: 10, pk: "11440-100206380", detailInfo: placeCategoryDetail15)

let placeCategoryDetail16 = [
    DetailInfo(categoryIdx: .facility, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 0
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160303
    검사일: 20190409
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20140825
    결과 내용: 정상
    점검일: 20140825
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20180414
    유효 기간 만료일: 20190413
    최종 검사일: 20180521
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20180521
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    시정 완료일: 20050406
    """)]

let placePlaceDetail16 = PlaceDetail(placeIdx: 137, name: "영명빌딩", address: "서울 마포구 마포대로8길 9 영명빌딩", totalGrade: .warn, legalName: "공덕동", num: "0249/0012", useIdx: 11, pk: "11440-7100", detailInfo: placeCategoryDetail16)

let placeCategoryDetail17 = [
    DetailInfo(categoryIdx: .facility, grade: .danger, detail: """
    최종 점검 진단 종료일: 20190521
    상태 평가 등급: B등급
    점검 진단 결과:
    대상건축물은 약 23년 9개월 정도 경과한 업무시설 및 근린생활시설 용도의 건축물로서 금번 정밀안전점검 결과 중대결함 부재나 특별히 보강을 요하는 구조부재는 없는 것으로 조사되었다. 균열 및 노후화 상태 조사 결과 일부 벽체 및 슬래브에서 대체적으로 0.10 mm ~ 0.35mm 정도의 균열이 발생된 것으로 조사되었으며, 지하층 경사로 및 주차장 천장 슬래브에서 누수흔적이 일부 발생된 것으로 조사되었다. 또한 콘크리트 노후화 및 강재 외관조사 결과 특이할 만한 결함은 조사되지 않았으며, 주요 구조부재에 대한 각 종 시험 및 변위·변형 조사 결과 설계기준에 적합한 상태인 것으로 조사되었다. 따라서 대상건축물은 전반적으로 양호한 상태인 것으로 사료된다. 한국시설안전공단 평가프로그램에 의한 등급은 상태평가 : 2.79(B등급) / 종합평가 : 2.26(B등급)이며, 이를 종합적으로 평가한 대상건축물의 안전등급은 B등급(양호) 이다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .danger, detail: """
    점검 결과 의견:
    1. 현재 승강기의 문이 방화성능이 있다고 판단 할 수 없으므로 층간방화 기능이 상실되었다고 판단됨. 이는 화재시 승강로를 통해 화염 및 연기가 건물 전체로 빠르게 전파 되는 원인이 될 수 있음. 그러므로 추후 승강기의 교체시 방화성능이 있는 승강기 문으로 교체 또는 승강장의 출입구에 방화셔터를 설치하여야 할 것임.
    2. 계단실의 바닥 마감과 지하2층 승강기실의 바닥, 벽체마감을 수선시에 불연성 재료로 교체하여 방화성능을 확보하는 것이 바람직함.
    3. 일부 추락의 위험이 있는 부분의(계단실, 2층 로비, 옥상) 난간이 기준 높이 이하로 설치되어 있음. 이는 안전사고의 원인이 되므로 기준높이 이상으로 교체하여야 함.
    3.현재 외벽이나 창호는 현행기준의 단열, 기밀성능을 만족하지 못하므로 효과적인 건축물 에너지 절약을 위해 외벽수선 또는 창호 수선시 현행법 기준에 맞는 단열, 창호를 설치하는 것이 바람직함.
    """),
    DetailInfo(categoryIdx: .fire, grade: .danger, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160530
    검사일: 20170329
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20131205
    결과 내용: 정상
    점검일: 20131205
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20180614
    유효 기간 만료일: 20190613
    최종 검사일: 20180709
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20180709
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .safe, detail: """
    대수선 내용:
    내부 ELEV 설치
    """)]

let placePlaceDetail17 = PlaceDetail(placeIdx: 142, name: "태영빌딩", address: "서울특별시 마포구 마포대로 144 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0252/0005", useIdx: 8, pk: "11440-7767", detailInfo: placeCategoryDetail17)

let placeCategoryDetail18 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190621
    상태 평가 등급: 양호
    점검 진단 결과:
    상태조사 결과 지붕층 바닥 방수보수를 하였으나 내부에 발생한 결함에 대하여는 보수를 하지 않은 것으로 확인되었다.  상태조사 결과 균열은 대부분 비내력 벽체에 발생한 균열로 확인되었고 계단실 슬래브에 발생한 균열은 모서리면에 발생하였으나 대부분 미세균열로 조사되었다.  지하층은 주차장 상부 슬래브에 누수흔적이 다수 발생하였고 일부 구간은 누수 유도관(지하1층 주방 하부)을 설치하여 배수중이다.  그리고 주차장 천장은 뿜칠 마감되어 균열확인은 어려우나 천장누수흔적과 바닥에 균열이 다수 발생한 것으로 보아 슬래브에도 균열이 발생한 것으로 사료된다.  현장조사를 종합하여 판단해 볼 때 전반적인 상태는 양호하나 현재 발생한 결함을 장기간 방치할 경우 건축물 사용성 및 안전성 저하의 원인이 되므로 지속적인 유지관리와 보수가 필요하다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    점검대상 건축물은 지하6층, 지상18층의 규모의 지방재정공제회 건물이다.
    건축물 유지？관리 점검항목은 6개 점검대항목, 36개 점검소항목, 50개 점검세부항목으로 분류되며 설계도서와의 적합여부를 토대로 5점 척도에 따라 계량적 평가방법으로 수행된다. 먼저 ‘점검세부항목’별 등급(점수)을 도출하고, 이의 산술평균값을 구하여 ‘점검소항목’별 점수를 도출한 후, 6개 각 점검대항목별 평균점수를 도출하였다. 이에 각 항목별 평균점수는 대지 (4 점), 높이 및 형태 (4 점), 구조안전 (3.7 점), 화재안전 (4 점), 건축설비 (4.5 점), 에너지 및 친환경 관리 등 (4 점)으로 평가되었다.
    종합적으로 비교적 도면과 현황이 일치하는 부분이 많았으며, 일부 조경면적의 변화가 있었으나 면적이 증가된 점, 건축설비 항목에서 5년 이내 교체된 주요설비들이 많은 점 등은 지속적인 관리가 되고 있다고 볼 수 있다. 에너지 및 친환경 관리 등의 항목에서 최근 단열필름 등 열손실 방지를 통해 에너지 절감을 위한 노력을 하고 있으며, 더 나아가 에너지 절감을 위해 친환경 건축물 인증, 지능형 건축물 인증, 에너지효율등급 인증을 고려해 볼 수 있을 것이다.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160309
    검사일: 20190325
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180419
    결과 내용: 정상
    점검일: 20180419
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20171127
    유효 기간 만료일: 20181126
    최종 검사일: 20171127
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20171127
    검사 종류: 정밀
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail18 = PlaceDetail(placeIdx: 143, name: "지방재정회관", address: "서울특별시 마포구 마포대로 136 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0253/0042", useIdx: 8, pk: "11440-7768", detailInfo: placeCategoryDetail18)

let placeCategoryDetail19 = [
    DetailInfo(categoryIdx: .facility, grade: .warn, detail: """
    최종 점검 진단 종료일: 20181203
    상태 평가 등급: 보통
    점검 진단 결과:
    1. 옥탑1층 파라펫 균열 발생. 2. 지상층 파라펫 균열 및 외부벽체 누수흔적+백태 발생. 3. 지상층 계단실 벽체 층간균열 발생. 4. 지하2층 주차장 상부슬래브 및 보 균열+누수흔적+백태 발생. 5. 지하3층 주차장 상부슬래브 내화피복 들뜸 및 탈락 발생. 6. 지하주차장 및 지하5층 기능실 벽체 조적균열 발생. 7. 지하5층 전기실 벽체 균열+누수 발생. 상기 조사된 결함의 경우 장기간 방치시 점검건물의 내구성 저하의 원인이 될 수도 있으므로 내구성 및 사용성 확보를 위해 보수요망.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    -전체적으로 보통 이상으로 양호한 유지관리가 되고 있음.
    -본 건축물은 1985년 준공된 건축물로 배연창의 대한 기준이 없으므로 현행법 기준에 맞추어 개선하여 화재발생시 자동으
    로 개폐 가능한 자동 배연창을 설치하여 안전성을 확보하는 것이 바람직하다.
    -주 출입구 앞 인도 일부 구간이 침하된 것을 육안으로 확인할 수 있으며, 침하된 일부 구간을 보수하여 보행자의 안전을
    확보하는 것이 바람직하다.
    -본 건축물의 지하주차장 상부Slab에서 균열 및 누수흔적이나 콘크리트 탈락 및 철근노출 등을 육안으로 볼 수 있었다. 이
    는 건축물의 내구성 저하뿐만 아니라 미관 &#8228; 사용성 저하를 초래할 수 있기 때문에 유지관리 계획을 수립하여 보수함이 바
    람직하다.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수:
    피난 계단 수: 2
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20150320
    검사일: 20190410
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20171028
    결과 내용: 정상
    점검일: 20171028
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20181211
    유효 기간 만료일: 20191210
    최종 검사일: 20181207
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20181207
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail19 = PlaceDetail(placeIdx: 144, name: "신용보증기금건물", address: "서울특별시 마포구 마포대로 122 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0254/0005", useIdx: 8, pk: "11440-7130", detailInfo: placeCategoryDetail19)

let placeCategoryDetail20 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190318
    상태 평가 등급: 양호
    점검 진단 결과:
    금번 점검결과, 지하층 일부 구조체에서 균열이 추가로 조사되었으나 경미한 수준이며, 지하3층 주차장 기둥 균열 부위에 설치하였던 크랙모니터(G-2)의 균열 진행은 없는 것으로 확인되었고, 1층 환기구 주변 바닥 손상 부위의 진행도 없는 것으로 조사되었다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    - 별정우체국연금관리단은 1994년에 준공되어 약 23년이 경과된 건축물로, 준공이후 대지, 건축물의 높이 및 형태는 특이할 만한 변경사항 없이 현재까지 유지되고 있음.
    - 시설물의 안전 및 유지관리에 관한 특별법에 의한 2종시설물로 구조안전과 관련하여 정기적으로 안전점검을 실시하고 있음.
    - 화재안전과 관련하여 주요 소방설비는 소방시설 설치유지 및 안전관리에 관한 법률에 따른 점검을 주기적으로 실시하고 그 결과에 따른 조치가 즉시 이루어지고 있으나, 일부 방화문에 고임목이 설치되어 방화성능을 저하시키는 부분은 제거하여 방화성능을 확보하는 것이 바람직함.
    - 그 밖에 승강기, 전기, 가스 등은 타 법령에서 정한 기준대로 정기적인 점검을 실시하고, 주요 건축설비들도 지속적인 정비와 교체, 유지보수를 통하여 성능 및 기능면에서 양호하게 관리되고 있음.
    - 따라서, 별정우체국연금관리단은 건축물의 성능 및 기능면에서 양호하게 관리되고 있는 것으로 판단됨.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20170706
    검사일: 20190522
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180914
    결과 내용: 정상
    점검일: 20180914
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180310
    유효 기간 만료일: 20190309
    최종 검사일: 20180510
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180510
    검사 종류: 정기
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail20 = PlaceDetail(placeIdx: 145, name: "별정우체국연금관리단", address: "서울특별시 마포구 마포대로 130 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0254/0008", useIdx: 8, pk: "11440-7769", detailInfo: placeCategoryDetail20)

let placeCategoryDetail21 = [
    DetailInfo(categoryIdx: .facility, grade: .danger, detail: """
    최종 점검 진단 종료일: 20190613
    상태 평가 등급: B등급
    점검 진단 결과:
    1) 본 정밀안전점검 대상인 LG마포빌딩 건축물은 서울시 마포구 마포대로 155에 위치한 지하4층/지상17층의 업무시설로서 준공년도는 1987년으로 약 31년 경과하였으며, 구조형식은 지하4층~지하1층은 Flat Slab(무량판)+Drop panel, 지상층은 철골+철근콘크리트 라멘조(SRC)로 이루어진 건축물이다.    2) 외관조사 결과   ① 지하주차장(B4F~B2F)   - 철근콘크리트 Flat Slab+Drop panel 구조   - 지하4층~지하2층 상부슬래브 미세균열 다수 및 0.3mm 균열    - 바닥 우레탄 마감재 균열 및 탈락 다수   - 조적벽체 일부 수직균열, 램프벽체 미장면 수직균열 다수   ② 지하층 내부(B4F~B1F)    - 철근콘크리트 Flat Slab+Drop panel 구조    - 지하4층 경유탱크창고, 일반창고 상부슬래브 균열 (0.3~0.5mm)    - 지하4층 경유탱크창고, 지하3층 배관실, 관말탱크실, 지하1층 공조실 상부슬래브 철근노출    - 지하4층 기계실, 변전실, 지하3층 통합창고, 복도, 지하1층 공조실 조적벽체 수직/사선 균열, 미장면 망상균열     - 지하4층 복도 상부슬래브 균열, 지하4층~지하2층 벽체, 계단실 개구부 주변 사선균열   ③ 지상층 내부(1F~17F)    - 철골+철근콘크리트 라멘구조(SRC)    - 지상4층, 지상9층 물탱크실 상부 슬래브 균열, 백태, 철근노출    - 지상5층 상부보 인장재 보강, 지상6층 체험관 슬래브 균열    - 지상11층(HSAD) 사무실 상부슬래브 0.3~0.4mm의 균열 다수     - 지상17층 공조실 조적벽체 사선균열(CW=20mm)    - 각 층 공조실 및 EPS실, 계단실 벽체, 슬래브 미장면 균열, 사무실 내부 기둥/벽체 접합부 균열 다수   ④ 지붕층 (Roof~PH2f)    - PH2층의 방수층 전반적 노후화, 균열, 파손 다수    - 난간벽체 미장면 망상균열 전반적    - PH2층 기계실 상부슬래브 균열(0.2~0.3mm), 누수흔적, 상부 보 측면 사선균열(0.2mm), 벽체 미장면 누수흔적     - PH2층 물탱크실 조적벽체 수평균열(0.3mm), 미장면 들뜸, 기계실 외벽 미장면 수직균열   ⑤ 건물외부     - 외부 주차장 화단벽체 균열,누수,백화, 난간벽체 균열 다수    - 외부 주차장측 바닥 경계석 이격, 바닥 침하 흔적   ⑥ 각 층별 하중증가 요인    - 지하1층 LG히다찌창고 모빌랙    - 지상4층 물탱크실    - 지상5층 기술시험장    - 지상8층 LG히다찌 서류보관실    - 지상9층 물탱크실    - 지상15층 도서관 모빌랙    3) 건축물 상태평가 결과    건축물 상태평가는 외관조사 및 재료시험의 결과를 바탕으로 실시하였으며, 종합평가 등급은 “B등급”(3.43) 『보조부재에 경미한 결함이 발생하였으나 건축？구조기능 발휘에는 지장이 없으며 내구성 증진을 위하여 일부 보수가 필요한 상태』로 평가되었다.   4) 건축물 정밀안전점검 결과 총평     본 LG마포빌딩 외관조사 결과 지하주차장 및 지상층 일부 슬래브에서 미세균열(균열폭 0.1~0.2mm)이 다수 발생하였으며, 특히 지상층의 경우 균열폭 0.3mm의 구조적인 균열도 일부 조사되었다. 이는 지하주차장 Flat Slab(무량판)구조 특성상 슬래브의 지지간격이 비교적 넓고 차량의 이동하중이 장기간 반복적으로 작용하였기 때문으로 판단되며, 지상층 사무실은 사용하중에 비해 다소 스팬(span=3.6m)은 큰 반면, 두께(t=120mm)는 얇은 것이 원인일 것으로 판단된다. 따라서 슬래브 구조체에 발생된 균열은 향후 구조 안전성 측면에서 보수가 필요할 것으로 판단된다.           그 외 발생한 조적벽체 균열 및 접합부 균열, 지붕 방수층 노후화 등 비구조체에 발생된 결함은 건물의 내구연한 증가와 공용중에 발생할 수 있는 일반적인 결함으로 보수가 시급한 정도는 아니며, 다만 건물의 사용성 및 관리 차원에서 보수를 계획하여 실시함이 바람직 할 것으로 판단된다.      따라서 본 LG마포빌딩은 슬래브에 일부 구조적인 균열은 발생되었으나, 건물의 중장기적인 안전성 및 내구성 확보 차원에서 보수를 실시하면 건물 전반의 안전성 및 사용성에 문제가 없는 양호한 상태인 것으로 판단된다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    본 건물은 1987년 11월 14일 사용 승인 되어 지속적인 리모델링과 2011~13년 동안 외부도색 및 기계,전기,소방,냉.난방 및 환기 설비를 전면 교체하여 매우 양호하게 관리되고 있으나 구조 안전 부분에서 지하 2층 상부 스라브 및 9층 물탱크실에 균열이 확인되므로 구조안전진단 업체를 통한 지속적 점검을 요함.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 0
    피난 계단 수: 0
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20180824
    검사일: 20180824
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190525
    결과 내용: 정상
    점검일: 20190525
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180817
    유효 기간 만료일: 20190816
    최종 검사일: 20180903
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180903
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail21 = PlaceDetail(placeIdx: 179, name: "LG마포빌딩", address: "서울특별시 마포구 마포대로 155 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0275/0000", useIdx: 8, pk: "11440-7776", detailInfo: placeCategoryDetail21)

let placeCategoryDetail22 = [
    DetailInfo(categoryIdx: .facility, grade: .warn, detail: """
    최종 점검 진단 종료일: 20190425
    상태 평가 등급: 보통
    점검 진단 결과:
    점검결과 지하층 천정 슬래브 일부 슬래브 및 벽체의 누수, 백태가 조사되어 보수가 요망된다. 옥상 난간 벽체 보수부 일부 균열이 재발생 되어 에폭시주입공법으로 보수가 요망되고, 지상층은 대부분 보수가 완료되고, 과하중이 작용하지 않는 전체적으로 양호한 상태로 확인되었다. 지상17~18층 계단참 부분의 창문 유리 균열이 미보수되어 보수를 필요로 한다. 지하2층 천장 슬래브에서는 지하1층의 사우  나 시설로 인한 일부 누수·백화가 조사되어 다수 보수는 되었으나 미보수 부분은 보수가 필요하다. 지하3층과 지하4층은 램프 입구 주차장 바닥 슬래브 균열과 벽체 균열이 일부 조사되었으며 지하4층 주차장 D·A 벽체 균열 및 누수 부분과 일부 슬래브 및 벽체 균열이 조사되었다. 슬래브의 경우 균열이 일부 진행 중인 것으로 조사되어 에폭시주입공법에 의한 보수가 필요하다. 전반적인 상태는 보통인 것으로 판단된다. 옥상층과 지하층에서 발생된 대부분의 균열은 사용성 및 노후화에 의한 균열로서 구조물의 내구성에는 큰 영향이 없을 것으로 판단되나 누수를 동반한 지하층 균열[슬래브] 부분은 에폭시주입공법으로 보수가 필요할 것으로 판단된다. 전체적인 상태 평가는 보통으로 판단된다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160602
    검사일: 20190429
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190219
    결과 내용: 정상
    점검일: 20190219
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180220
    유효 기간 만료일: 20190219
    최종 검사일: 20180419
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20180419
    검사 종류: 정밀
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    적발일: 20041013

    """)]

let placePlaceDetail22 = PlaceDetail(placeIdx: 200, name: "풍림VIP텔", address: "서울특별시 마포구 마포대로 127 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0404/0000", useIdx: 8, pk: "11440-7789", detailInfo: placeCategoryDetail22)

let placeCategoryDetail23 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190425
    상태 평가 등급: 양호
    점검 진단 결과:
    대상구조물에 대한 정기안전점검 실시 결과, 조사일 현재 구조적 중대한 결함은 없는 양호한 상태로 내？외부 마감상태도 건전하다. 지상층은 전반적으로 양호한 상태로 조사되었다. 따라서 구조적인 문제는 없으며, 일상적인 육안점검을 통해 신규로 결함이 발생하는지의 여부를 체크하여 유지관리 할 것을 건의한다. 지하층의 주요구조부재는 대체로 양호한 상태이나, 일부 부재(벽체, 슬래브, 보)에 균열, 누수흔적, 백태가 조사되었다. 상기 결함들은 발생정도가 경미하며, 대부분 기존점검에서 도출된 결함으로 현재 확산증상은 없으며, 신규로 발생된 결함 역시 특별한 이상 징후는 없는 것으로 판단된다. 따라서 시급한 보수는 필요치 않은 상태이나, 구조물에 사용성 확보 및 장기적인 유지관리를 위하여 지속적인 관찰과 함께 향후 적절한 시기에 보수할 것을 건의한다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .safe, detail: """
    점검 결과 의견:
    대상 구조물에 대한 건축물 유지관리 정기점검을 실시한 결과, 점검 대 항목별로 대지 4.0점, 높이 및 형태 4.0점, 구조안전 4.0점, 화재안전 3.7점, 건축설비 3.9점, 에너지 및 친환경관리 3.3점, 장애인 편의시설 4.0점으로 평가되었으며, 유지관리 점검항목 전체평균점수는 3.8점으로 평가되었다. 본 건축물은 1993년 06월에 준공되어 사용기간이 약 23년이 지난 업무 및 판매시설이다. 점검 결과, 사용기간 대비 전반적인 설비상태는 비교적 양호한 상태이며, 구조물의 안전에 중대한 영향을 미칠 수 있는 결함은 발견되지 않았다. 따라서 제도적으로 실시하는 유지관리 정기점검 및 각종 안전점검(소방, 전기, 엘리베이터)등을 통한 관리인의 지속적인 유지관리가 이루어진다면 향후에도 구조물이 양호한 상태를 유지할 수 있을 것으로 사료된다.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 0
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20150520
    검사일: 20150520
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190428
    결과 내용: 정상
    점검일: 20190428
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .warn, detail: """
    유효 기간 시작일: 20181112
    유효 기간 만료일: 20191111
    최종 검사일: 20181201
    최종 검사 종류: 정기
    최종 검사 결과: 조건부합격
    검사 일자: 20181201
    검사 종류: 정기
    합격 유무: 조건부합격
    """),
    DetailInfo(categoryIdx: .building, grade: .danger, detail: """
    ※ 건축물 위반 내역 ※
    적발일: 20100715

    """)]

let placePlaceDetail23 = PlaceDetail(placeIdx: 201, name: "공덕빌딩", address: "서울특별시 마포구 마포대로 119 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0450/0000", useIdx: 8, pk: "11440-7601", detailInfo: placeCategoryDetail23)

let placeCategoryDetail24 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190510
    상태 평가 등급: 양호
    점검 진단 결과:
    1. 검토 결과 (x 방향)pushover 해석을 통하여 구조물의 x 방향 소성힌지 발생상황을 확인해 본 결과, 본 구조물은 현 상태에서 ‘인명안전’에 해당하는 성능을 보유하고 있는 것으로 확인됨. 또한, 성능점에서의 최대 층간변위비(0.1277%) 또한 허용기준(1.0%)을 만족하는 것으로 확인됨. - 비탄성 밑면전단력 : 13,190.0 kN - 비탄성 응답가속도 : 0.1383 g - 비탄성 층간변위비 : 0.1277%  2. 검토 결과 (y 방향)pushover 해석을 통하여 구조물의 y 방향 소성힌지 발생상황을 확인해 본 결과, 본 구조물은 현 상태에서 ‘인명안전’에 해당하는 성능을 보유하고 있는 것으로 확인됨. 또한, 성능점에서의 최대 층간변위비(0.4204%) 또한 허용기준(1.0%)을 만족하는 것으로 확인됨. - 비탄성 밑면전단력 : 6,545.0 kN - 비탄성 응답가속도 : 0.06127 g - 비탄성 층간변위비 : 0.4204%  3. 종합 결론pushover 해석을 통하여 구조물의 소성힌지 발생상황을 종합해 본 결과, 본 구조물은 현 상태에서 ‘인명안전’ 에 해당하는 성능을 보유하고 있는 것으로 확인되므로, 별도의 내진 보강은 필요하지 않은 것으로 사료됨.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .safe, detail: """
    점검 결과 의견:
    제반규정에 적법하게 유지 및 관리되고 있는 것으로 사료됨.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20181108
    검사일: 20190516
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190324
    결과 내용: 정상
    점검일: 20190324
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180209
    유효 기간 만료일: 20190208
    최종 검사일: 20180209
    최종 검사 종류: 정밀
    최종 검사 결과: 합격
    검사 일자: 20180209
    검사 종류: 정밀
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail24 = PlaceDetail(placeIdx: 202, name: "한국사회복지회관 르네상스 타워", address: "서울특별시 마포구 만리재로 14, 르네상스타워빌딩 르네상스 타워 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0456/0000", useIdx: 8, pk: "11440-7802", detailInfo: placeCategoryDetail24)

let placeCategoryDetail25 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190329
    상태 평가 등급: 양호
    점검 진단 결과:
    본 마포 신영지웰 오피스텔 정기안전점검 결과는 4.9. 정기안전점검 결과 총평에 상세히 서술한 바와 같이 결함사항은 건축물의 시공당시 콘크리트 소성？건조수축 및 사용 환경에 의하여 발생된 일반적인 결함사항으로 점검일 현재 구조물 안전성에는 미치는 영향은 미미한 사항으로 판단되며, 종합 의견사항은 다음과 같다.    1. 구조적으로 위험한 상태는 없는 것으로 나타났으며, 상위의 정밀안전점검, 정밀안       전진단은 필요하지 않은 것으로 판단된다.   2. 시설물의 사용제한이 필요한 곳도 없는 것으로 판단된다.   3. 본 건물 일부에 발생한 균열이 각층 구조체 균열 및 누수흔적과 비구조체 조적벽      체 수직 경사 수평균열, 창문틀 주변 사춤몰탈 건조수축균열, 마감재 페인트 박리      등이 발생하였으며, 그 중 구조체 균열 및 누수흔적 및 기둥 균열은 주요 감시대      상으로 선정하여 정기적으로 관찰이 필요합니다.    그리고 보수는 시급한 사항이 아니므로 건물의 장기충당수선 계획에 따라 보수계획을 수립하여 보수 하시면 될 것으로 판단됩니다.        따라서, 『마포 신영지웰 오피스텔』 건축물의 전반적인 상태는 점검일 현재 양호한 상태를 유지하고 있는 것으로 점검되었다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: """
    점검 결과 의견:
    본 마포신영지웰은 1997년 06월 24일 허가 받아 2002년 07월 23일 준공된 건물로 로서 금번 건축법에 의해 시행하는 유지관리 정기점검을 실시한 결과 1997년 06월 24일 허가일 이전 설계당시 기준을 근거로 검토한 결과 대부분 항목에서 기준을 유지하고 있는 것으로 점검되었다. 본 건물의 시설중 승강기 시설, 환기시설, 개별 냉ㆍ난방시스템 및 공용부 보일러 난방방식, 전기 수전설비 및 배전설비, 구조물의 안전성 등 모두 안전과 유지관리가 정상인 것으로 확인되었고, 유지관리 과정에서 일부 고장 등이 발생하는 경우 즉시 보수가 이루어지는 상태를 유지하고 있다.
    본 건물의 평가는 총 37개 항목중 설계당시 기준이 없어 점검대상에서 적용대상이 아닌 7개항목을 제외하고 점검한 결과  점검 항목별 평균점수는 대지 4점, 높이 및 형태 4점, 구조안전 4점, 화재안전 3.9점, 건축설비 3.3점, 에너지 및 친환경 관리 3점 등 건축물의 전체 상태에 대한 종합평가는 3.7점으로 사업승인도서에 적합하고 성능이 보통으로 유지되는 상태이다.
    """),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수:
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20140528
    검사일: 20140528
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190113
    결과 내용: 정상
    점검일: 20190113
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180525
    유효 기간 만료일: 20190524
    최종 검사일: 20180615
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180615
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail25 = PlaceDetail(placeIdx: 205, name: "마포신영지웰 오피스텔", address: "서울특별시 마포구 백범로 178 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0461/0000", useIdx: 8, pk: "11440-7830", detailInfo: placeCategoryDetail25)

let placeCategoryDetail26 = [
    DetailInfo(categoryIdx: .facility, grade: .danger, detail: """
    최종 점검 진단 종료일: 20190830
    상태 평가 등급: B등급
    점검 진단 결과:
    1.본대상 건축물은 사용승인 이후 약 13년 10개월 경과된 상태로 자료수집 및 분석. 외관조사. 재료시험 및 측정 건축물대장등을 통한 검토 결과 부재내력의 손실 등에 의한 구조체에 이상 징후나 물리적 현상등이 발생 되지 않은 것으로 검토되었다.  2.본 건축물의 옥탑층 외부 난간 수직 균열, 지상 코어 계단실 벽체 사선 수평 균열, 천장 균열이 조사되었으며 복도 창호 상부 수직 균열, 개구부 상부 및 하부 균열이 대부분으로 조사되었다. 지하구조물의 주차장 및 램프 벽체 보수면 재균열과 천장 균열 및 누수 오염현상이 조사되었으며 지하저수조 벽체 누수 백화 현상, 전기실？기계실 벽체 수직사선 균열이 조사되었다. 또한 지하 최하층 바닥 균열에 의한 누수 현상이 진행형으로 조사되어 조속한 보수조치가 요구된다.  3.콘크리트 압축강도 시험결과 평균압축강도가 설계기준강도를 상회하는 것으로 나타났다.  4.부재의 규격에 대하여 현장실측결과 설계도면에 명시된 치수에 준하여 시공되었으며 탄산화시험 결과에서는 B등급으로 탄산화로 인한 내구성 저하요인은 없는 상태인 것으로 조사되었다.  5.지하 4층 천장보 부재처짐 측정결과 양호한 상태이며 기울기 조사결과 수직수평기울기 모두 A등급으로 안전조치기준에 양호한 상태로 나타났다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 0
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20140801
    검사일: 20140801
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20170519
    결과 내용: 정상
    점검일: 20170519
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180628
    유효 기간 만료일: 20190627
    최종 검사일: 20180816
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180816
    검사 종류: 정기
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail26 = PlaceDetail(placeIdx: 206, name: "마포공덕파크팰리스II", address: "서울특별시 마포구 마포대로 143 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0462/0000", useIdx: 1, pk: "11440-7831", detailInfo: placeCategoryDetail26)

let placeCategoryDetail27 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190603
    상태 평가 등급: 양호
    점검 진단 결과:
    금회 점검 결과, 용도변경, 중량물의 적재 등과 같은 사용하중의 증가요소나 구조부재의 변경 이력은 없는 양호한 상태를 유지하고 있는 것으로 확인되었다. 건축물 전반에 걸친 외관손상조사 결과, 일부 구조체에서 균열, 누수, 누수흔적, 강재부식 등의 손상이 조사되어 구조체의 내구성을 저하시키는 요인으로 작용하고 있으나, 조사된 손상에서 구조적인 안전성에 문제가 될 만한 이상소견이나 중대한 결함은 발생하지 않은 것으로 조사되었고, 지하1층~지하2층 주차램프 벽체 및 지하4층 주차장 기둥 균열 부위에 크랙모니터(G-1,2)를 신규 설치하여 균열 변위 발생 여부를 가시화하였다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20160729
    검사일: 20181025
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20190807
    결과 내용: 정상
    점검일: 20190807
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180811
    유효 기간 만료일: 20190810
    최종 검사일: 20180913
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180913
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail27 = PlaceDetail(placeIdx: 207, name: "마포현대하이엘오피스텔", address: "서울특별시 마포구 마포대로 173 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0463/0000", useIdx: 8, pk: "11440-7832", detailInfo: placeCategoryDetail27)

let placeCategoryDetail28 = [
    DetailInfo(categoryIdx: .facility, grade: .danger, detail: """
    최종 점검 진단 종료일: 20190226
    상태 평가 등급: B등급
    점검 진단 결과:
    [아파트/오피스텔] 옥탑 헬리포트 바닥 마감재 들뜸 및 탈락 다수 발생한 것으로 조사되었다. 옥탑 외벽 망상 및 층간 균열과 백화 현상 관찰되었다. 101동 상층부 계단실 벽체 층간 균열 및 경사 균열 다수 관찰되었다. 102동 상층부 계단실 벽체 층간 균열 일부 관찰되며, 보수 공사 흔적 조사되었다. 지하주차장 B5-B8층 바닥 균열 일부 관찰되나 전반적으로 양호한 것으로 조사되었다. 또한 천장 슬라브 균열 다수 관찰되었으며, 누수흔적 및 도장 탈락 조사되었다. 벽체는 경사균열 일부 조사되었다. 지하주차장 B8층 RAMP 바닥 지하수 유입으로 인한 물고임 발생 조사되었다.   [호텔] 계단실#1, 계단실#2 상층부 계단실 벽체 층간균열 일부 관찰되었다. 지하B1~B2층 계단실 내력벽 누수 관찰되었다. 지하주차장 B4층 RAMP 벽체 균열 및 누수 다수 관찰되었다. 천장 슬라브 누수 흔적 다수 관찰되었다. 천장 보 휨 및 전단균열 일부 관찰되었다.  [판매시설] 지하주차장 B2-B3층 RAMP 천장 균열 및 누수흔적 일부 조사되었다. 또한 바닥 균열 및 에폭시 탈락 일부 관찰되었으며, 천장 슬라브 균열, 도장탈락, 누수흔적 일부 관찰되었다. 기둥 상부 도장들뜸 및 미세균열 일부 관찰되었다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: Y
    특별 피난 계단 수: 1
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20170908
    검사일: 20170908
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180515
    결과 내용: 정상
    점검일: 20180515
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180115
    유효 기간 만료일: 20190114
    최종 검사일: 20180209
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180209
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail28 = PlaceDetail(placeIdx: 208, name: "롯데캐슬프레지던트", address: "서울특별시 마포구 마포대로 109 (공덕동)", totalGrade: .warn, legalName: "공덕동", num: "0467/0000", useIdx: 8, pk: "11440-100188281", detailInfo: placeCategoryDetail28)

let placeCategoryDetail29 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190608
    상태 평가 등급: 양호
    점검 진단 결과:
    “S-OIL사옥빌딩” 시설물에 대한 2019년 상반기 정기점검 결과 건물의 단면, 주요 구조체의 변경 및 용도변경 등은 없는 상태이고, 2018년 하반기 정기점검 시와 변화가 없는 상태로 주요 구조체는 전반적으로 양호한 상태이다. 다만, 지하층의 경우 지하7층(하부) 정화조 관리실, 저수조 벽체에서 누수흔적 및 페인트 탈락이 발생된 상태이고, 중수조관리실, 전기실 벽체에서도 수직 및 경사균열 등이 조사 되었다. 따라서 구조체의 내구성 및 기능성을 확보하기 위해 보수가 필요하다고 판단되며, 보수방법으로는 에폭시 주입 및 폴리우레탄 수지 주입공법 등으로 보수함이 바람직하다. 또한, 지하주차장 램프 벽체 및 상부 Slab에 발생된 미세균열에 대하여 에폭시 수지 주입공법 등으로 보수함으로써 구조물의 중성화 방지 및 내구성을 확보 바란다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .safe, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부: N
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20190712
    검사일: 20190712
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20180309
    결과 내용: 정상
    점검일: 20180309
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180428
    유효 기간 만료일: 20190427
    최종 검사일: 20180810
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180810
    검사 종류: 정기
    합격 유무: 조건후합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail29 = PlaceDetail(placeIdx: 210, name: "에쓰오일사옥빌딩", address: "서울특별시 마포구 백범로 192 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0471/0000", useIdx: 8, pk: "11440-100199168", detailInfo: placeCategoryDetail29)

let placeCategoryDetail30 = [
    DetailInfo(categoryIdx: .facility, grade: .safe, detail: """
    최종 점검 진단 종료일: 20190603
    상태 평가 등급: 양호
    점검 진단 결과:
    건축물의 구조부재에 대한 정밀육안조사를 실시한 결과 시설물의 전반적인 상태는 양호한 것으로 확인되었다. 변위조사(처짐) 결과 모든 측점에서 허용기준치 이내로 확인되었으며, 초기 측정값과 비슷한 값을 나타내는 것으로 확인되었다. 부재결함은 옥탑층 및 지상층(벽체, 슬래브), 지하층(벽체, 기둥, 슬래브)에서 균열 및 누수흔적, 박리 등의 형태로 허용기준치 이내로 확인되었다. 발생한 결함에 대해서는 주기적인 관찰 및 관리를 통해 변위를 확인하는 것이 좋겠다. 따라서 주요부재에 경미한 결함이 발생하였으나 건축.구조기능 발휘에는 지장이 없으며 내구성 증진을 위하여 일부의 보수가 필요한 상태인 양호등급으로 지정하였다.
    """),
    DetailInfo(categoryIdx: .maintenance, grade: .unknown, detail: ""),
    DetailInfo(categoryIdx: .fire, grade: .warn, detail: """
    자체 점검 대상 여부: Y
    대형 화재 취약 대상 여부:
    특별 피난 계단 수: 2
    피난 계단 수:
    """),
    DetailInfo(categoryIdx: .gas, grade: .safe, detail: """
    최종 검사일: 20180727
    검사일: 20180727
    검사 결과명: 적합
    """),
    DetailInfo(categoryIdx: .electronic, grade: .safe, detail: """
    최종 점검 일: 20170729
    결과 내용: 정상
    점검일: 20170729
    점검 결과: 합격
    """),
    DetailInfo(categoryIdx: .elevator, grade: .safe, detail: """
    유효 기간 시작일: 20180428
    유효 기간 만료일: 20190427
    최종 검사일: 20180508
    최종 검사 종류: 정기
    최종 검사 결과: 합격
    검사 일자: 20180508
    검사 종류: 정기
    합격 유무: 합격
    """),
    DetailInfo(categoryIdx: .building, grade: .unknown, detail: "")]

let placePlaceDetail30 = PlaceDetail(placeIdx: 211, name: "KPX빌딩", address: "서울특별시 마포구 마포대로 137 (공덕동)", totalGrade: .safe, legalName: "공덕동", num: "0473/0000", useIdx: 8, pk: "11440-100201329", detailInfo: placeCategoryDetail30)

var corePlace = [
    placePlaceDetail1, placePlaceDetail2, placePlaceDetail3, placePlaceDetail4, placePlaceDetail5,
    placePlaceDetail6, placePlaceDetail7, placePlaceDetail8, placePlaceDetail9, placePlaceDetail10,
    placePlaceDetail11, placePlaceDetail12, placePlaceDetail13, placePlaceDetail14, placePlaceDetail15,
    placePlaceDetail16, placePlaceDetail17, placePlaceDetail18, placePlaceDetail19, placePlaceDetail20,
    placePlaceDetail21, placePlaceDetail22, placePlaceDetail23, placePlaceDetail24, placePlaceDetail15,
    placePlaceDetail26, placePlaceDetail27, placePlaceDetail28, placePlaceDetail29, placePlaceDetail30]
