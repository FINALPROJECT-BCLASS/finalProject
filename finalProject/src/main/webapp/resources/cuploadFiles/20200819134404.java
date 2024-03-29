package regTest;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
/*
    * 1. 정규 표현식(Regular Expression, 줄여서 Regex, RegExp)
    *   : 특정한 규칙을 가진 문자열의 집합을 표현하기 위한 형식언어
    * 
    * 2. 문법은 세가지로 나눔
    *    1) 패턴 그대로를 매칭 : 단어 그대로를 패턴으로 사용
    *    2) 메타문자 및 수량 한정자를 적용 : 정규식 패턴에 쓰이는 특별한 의미를 지니는 메타 문자로 폭넓은 패턴에 매치
    *    3) 그룹 및 look around 기능을 적용 : 패턴의 일부를 그룹으로 묶거나, 특정 패턴의 앞 뒤로 다른 패턴이 오는 조건을 더함
    * 
    * 3. 정규식 메타 문자
    * ^ : 문자열의 시작
    * $ : 문자열의 종료
    * . : 임의의 한 문자(단, \는 넣을 수 없음)
    * * : 앞 문자가 없을 수도 무한정 많을 수도 있음
    * + : 앞 문자가 하나 이상
    * ? : 앞 문자가 없거나 하나 있음
    * [] : 문자의 집합이나 범위, []내에서 ^가 선행하여 존재하면 not을 나타냄
    * {} : 횟수 또는 범위
    *      {n} - n번 반복
    *      {n,} - n번 이상 반복
    *      {n,m} - n번이상 m번 이하 반복
    * () : 소괄호 안의 문자를 하나의 문자로 인식
    * | : 패턴 안에서 or연산을 수행할 때 사용
    * \s : 공백 문자
    * \S : 공백 문자가 아닌 나머지 문자
    * \w : 알파벳이나 숫자
    * \W : 알파벳이나 숫자를 제외한 문자
    * \d : 숫자 [0-9]와 동일
    * \D : 숫자를 제외한 모든 문자
    * \ : 역슬래시 다음에 일반 문자가 오면 특수문자로 취급하고
    *     역슬래시 다음에 특수문자가 오면 그 문자 자체를 의미
    * (?i) : 앞 부분에 (?i)라는 옵션을 넣어주면 대소문자를 구분하지 않음
    * 
    * 
    * 4. 그림으로 확인할 수 있는 사이트
    *    https://regexper.com/
    *    
    * 5. 자주 쓰이는 패턴
    *    1) 숫자만 : ^[0-9]*$    
    *    2) 영문자만 : ^[a-zA-Z]*$ 
    *    3) 한글만 : ^[가-힣]*$
    *    4) 영어 & 숫자만 : ^[a-zA-Z0-9]*$
    *    5) E-Mail : ^[a-zA-Z0-9]+@[a-zA-Z0-9]\.[a-zA-Z0-9]$
    *    6) 휴대폰 : ^01(?:0|1|[6-9]) - (?:\d{3}|\d{4}) - \d{4}$
    *    7) 일반전화 : ^\d{2,3} - \d{3,4} - \d{4}$
    *    8) 주민등록번호 : \d{6} \- [1-4]\d{6}
    *    9) IP 주소 : ([0-9]{1,3}) \. ([0-9]{1,3}) \. ([0-9]{1,3}) \. ([0-9]{1,3})
    * 
    */
	
	public static void main(String[] arg) {
		Scanner sc = new Scanner(System.in);
		System.out.println("아무값이나 입력하세요:");
		String inputStr = sc.nextLine();
		System.out.println(inputStr);
	
//		1. Matcher에서 제공하는 find()메소드 써서 해보기
//		Pattern p = Pattern.compile("(^[0-9]+$)");
//		Matcher m = p.matcher(inputStr);
//		
//		if(m.find()) {
//			System.out.println(inputStr);
//		}else {
//			System.out.println("정규식에 어긋남");
//		}
//		
//		2. Pattern에서 제공하는 matches메소드 쓰기
		if(Pattern.matches("([0-9]{1,3}\\.([0-9]{1,3})", inputStr)) {
			System.out.println(inputStr);
		}else {
			System.out.println("정규식에 어긋남");
		}
	
	}
	
	
}



























