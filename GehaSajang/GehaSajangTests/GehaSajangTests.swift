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
    
    // MARK:- ConditionChecker
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
        
        //when
        var isValid = ConditionChecker.isFilled(emailText: email, passwordText: nil)
        //then
        XCTAssertEqual(isValid, false, "비밀번호가 빈 값입니다. nil")
        
        //given
        email = "abcdef@ghijk.lmn"
        password = ""
        //when
         isValid = ConditionChecker.isFilled(emailText: email, passwordText: password)
        //then
        XCTAssertEqual(isValid, false, "비밀번호가 빈 값입니다.")
        
        //given
        email = "   "
        password = "1"
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
        XCTAssertEqual(isValid, false, "이메일이 빈 값입니다. newline")
    }
    
    func testAllBlanksFilled() {
        // given
        let userInfoData = InputUserData()
        let email = "asdf@asdf.com"
        let password = "password12"
        let passwordCheck = "password12"
        userInfoData.inputEmail = email
        userInfoData.inputPassword = password
        userInfoData.inputPasswordCheck = passwordCheck
        // when
        var isValid = ConditionChecker.areAllBlanksFilled(in: userInfoData)
        // then
        XCTAssertEqual(isValid, true, "필수 항목인 이메일, 비밀번호, 비밀번호 확인 칸이 모두 채워졌습니다.")
    }
    
    func testSomeBlanksNotFilled() {
        // given
        var userInfoData = InputUserData()
        var email = " "
        var password = "password12"
        var passwordCheck = "password12"
        userInfoData.inputEmail = email
        userInfoData.inputPassword = password
        userInfoData.inputPasswordCheck = passwordCheck
        // when
        var isValid = ConditionChecker.areAllBlanksFilled(in: userInfoData)
        // then
        XCTAssertEqual(isValid, false, "필수 항목인 이메일, 비밀번호, 비밀번호 확인 칸이 모두 채워지지 않았습니다. - 이메일 white space ")
        
        // given
        userInfoData = InputUserData()
        email = ""
        password = "password12"
        passwordCheck = "password12"
        userInfoData.inputEmail = email
        userInfoData.inputPassword = password
        userInfoData.inputPasswordCheck = passwordCheck
        // when
        isValid = ConditionChecker.areAllBlanksFilled(in: userInfoData)
        // then
        XCTAssertEqual(isValid, false, "필수 항목인 이메일, 비밀번호, 비밀번호 확인 칸이 모두 채워지지 않았습니다. - 이메일 no value ")
        
        // given
        userInfoData = InputUserData()
        email = "\n"
        password = "password12"
        passwordCheck = "password12"
        userInfoData.inputEmail = email
        userInfoData.inputPassword = password
        userInfoData.inputPasswordCheck = passwordCheck
        // when
        isValid = ConditionChecker.areAllBlanksFilled(in: userInfoData)
        // then
        XCTAssertEqual(isValid, false, "필수 항목인 이메일, 비밀번호, 비밀번호 확인 칸이 모두 채워지지 않았습니다. - 이메일 newline ")
        
        // given
        userInfoData = InputUserData()
        email = "email@asdf.com"
        password = ""
        passwordCheck = "password12"
        userInfoData.inputEmail = email
        userInfoData.inputPassword = password
        userInfoData.inputPasswordCheck = passwordCheck
        // when
        isValid = ConditionChecker.areAllBlanksFilled(in: userInfoData)
        // then
        XCTAssertEqual(isValid, false, "필수 항목인 이메일, 비밀번호, 비밀번호 확인 칸이 모두 채워지지 않았습니다. - 비밀번호 no value ")
        
        // given
        userInfoData = InputUserData()
        email = "email@asdf.com"
        password = "password12"
        passwordCheck = ""
        userInfoData.inputEmail = email
        userInfoData.inputPassword = password
        userInfoData.inputPasswordCheck = passwordCheck
        // when
        isValid = ConditionChecker.areAllBlanksFilled(in: userInfoData)
        // then
        XCTAssertEqual(isValid, false, "필수 항목인 이메일, 비밀번호, 비밀번호 확인 칸이 모두 채워지지 않았습니다. - 비밀번호 확인 no value ")
    }
}
