//
//  GehaSajangTests.swift
//  GehaSajangTests
//
//  Created by Keunna Lee on 2020/08/06.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import XCTest
@testable import GehaSajang

class GehaSajangTests: XCTestCase {
    
    func testValidEmail() {
        //given
        let email = "abcdef@ghijk.lmn"
        //when
        let isValid = ConditionChecker.isValidEmail(email)
        //then
        XCTAssertEqual(isValid, true, "@와 .이 포함된 문자열입니다.")
    }
    
    func testInvalidEmail() {
        //given
        var email = "abcdef@ghijklmn"
        //when
        var isValid = ConditionChecker.isValidEmail(email)
        //then
        XCTAssertEqual(isValid, false, "@와 .이 포함되지 않은 문자열(둘 중에 하나가 누락된 경우 포함)입니다.")
        
        //given
        email = "a"
        //when
        isValid = ConditionChecker.isValidEmail(email)
        //then
        XCTAssertEqual(isValid, false, "2자 미만의 문자열입니다.")
        
        //given
        email = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
        //when
        isValid = ConditionChecker.isValidEmail(email)
        //then
        XCTAssertEqual(isValid, false, "120자 초과의 문자열입니다.")
    }
    
    func testValidPassword() {
        //given
        let password = "asdfasdf31"
        //when
        let isValid = ConditionChecker.isValidPassword(password)
        //then
        XCTAssertEqual(isValid, true, "영문과 숫자가 모두 포함된 8자~16자 문자열입니다.")
    }
    
    func testInvalidPassword() {
        //given
        var password = "abcdefae"
        //when
        var isValid = ConditionChecker.isValidPassword(password)
        //then
        XCTAssertEqual(isValid, false, "영문과 숫자가 포함되지 않은 문자열입니다.")
        
        //given
        password = "가나다라마바12"
        //when
        isValid = ConditionChecker.isValidPassword(password)
        //then
        XCTAssertEqual(isValid, false, "영문과 숫자가 포함되지 않은 문자열입니다.")
        
        //given
        password = "abcde"
        //when
        isValid = ConditionChecker.isValidPassword(password)
        //then
        XCTAssertEqual(isValid, false, "8자 미만의 문자열입니다.")
        
        //given
        password = "asdfasdfasdfasdfasdf"
        //when
        isValid = ConditionChecker.isValidPassword(password)
        //then
        XCTAssertEqual(isValid, false, "16자 초과의 문자열입니다.")
    }
    
    func testValidLength() {
        //given
        var text = "ab"
        //when
        var isValid = ConditionChecker.isValidLength(text: text, minimum: 2, maximum: 10)
        //then
        XCTAssertEqual(isValid, true, "글자수가 2자 이상 10자 이하입니다.")
        
        //given
        text = "abcdefghij"
        //when
        isValid = ConditionChecker.isValidLength(text: text, minimum: 2, maximum: 10)
        //then
        XCTAssertEqual(isValid, true, "글자수가 2자 이상 10자 이하입니다.")
    }
    
    func testInvalidLength() {
        //given
        var text = "a"
        //when
        var isValid = ConditionChecker.isValidLength(text: text, minimum: 2, maximum: 10)
        //then
        XCTAssertEqual(isValid, false, "글자수가 2자 미만입니다.")
        
        //given
        text = "abcdefghijk"
        //when
        isValid = ConditionChecker.isValidLength(text: text, minimum: 2, maximum: 10)
        //then
        XCTAssertEqual(isValid, false, "글자수가 10자 초과입니다.")
    }
    
    func testFilled() {
        //given
        let email = "abcdef@ghijk.lmn"
        let password = "asdfasdf"
        //when
        let isValid = ConditionChecker.isFilled(emailText: email, passwordText: password)
        //then
        XCTAssertEqual(isValid, true, "이메일과 비밀번호를 모두 작성하였습니다.")
    }
    
    func testUnFilled() {
        //given
        var email = "abcdef@ghijk.lmn"
        var password: String?
        // String은 ""나 nil이 없다.
        // "" 이 것도 입력 값으로 보인다
        // 그렇다면 썼다가 지우면 isEmpty 상태일까 아니면 ""라도 값을 가지고 있을까?
        
        //password.isEmpty = true
        //when
        var isValid = ConditionChecker.isFilled(emailText: email, passwordText: nil)
        //then
        XCTAssertEqual(isValid, false, "비밀번호가 빈 값입니다. nil")
        
        //given
        email = "abcdef@ghijk.lmn"
        password = ""
        // String은 ""나 nil이 없다.
        // "" 이 것도 입력 값으로 보인다
        // 그렇다면 썼다가 지우면 isEmpty 상태일까 아니면 ""라도 값을 가지고 있을까?
        
        //password.isEmpty = true
        //when
         isValid = ConditionChecker.isFilled(emailText: email, passwordText: password)
        //then
        XCTAssertEqual(isValid, false, "비밀번호가 빈 값입니다.")
        
        //given
        email = "   "
        password = "1"
        // String은 ""나 nil이 없다.
        // "" 이 것도 입력 값으로 보인다
        // 그렇다면 썼다가 지우면 isEmpty 상태일까 아니면 ""라도 값을 가지고 있을까?
        
        //password.isEmpty = true
        //when
         isValid = ConditionChecker.isFilled(emailText: email, passwordText: password)
        //then
        XCTAssertEqual(isValid, false, "이메일이 빈 값입니다. white space")
        
        //given
        email = "\n"
        password = "password"
        //when
         isValid = ConditionChecker.isFilled(emailText: email, passwordText: password)
        //then
        XCTAssertEqual(password?.isBlank, false, "이메일이 빈 값입니다. newline")
    }

}
