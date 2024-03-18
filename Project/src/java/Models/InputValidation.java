/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author Asus
 */
public class InputValidation {

    private InputValidation() {
        throw new IllegalStateException("Utility class");
    }

    //(.+) trùng với 1 hoặc nhiều ký từ trừ khoảng trắng.
    //(\\.[\\w]+)* trùng với 1 hoặc nhiều hơn dấu . đi kèm với w
    //?=.* có ít nhất 1
    //?![._-]) Không được trùng với ký tự trong ngoặc vuông
    private static final String EMAIL_PATTERN = "^(.+)@[\\w-]+(\\.[\\w]+){0,3}(\\.[a-zA-Z]{2,})$";
    private static final String PHONE_PATTERN = "^\\d{9,11}";
    private static final String USERNAME_PATTERN = "^[a-zA-Z0-9._-]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$";
    private static final String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[*.!@$%^&]).{8,32}$";
    private static final String USER_FULLNAME_CHECK = "^[\\p{L}]+(\\ [\\p{L}]+){1,5}$";

    public static boolean isEmailValid(String testString) {
        return testString.matches(EMAIL_PATTERN);
    }

    public static boolean isPhoneValid(String testString) {
        return testString.matches(PHONE_PATTERN);
    }

    public static boolean isUsernameValid(String testString) {
        return testString.matches(USERNAME_PATTERN);
    }

    public static boolean isPasswordValid(String testString) {
        return testString.matches(PASSWORD_PATTERN);
    }
    
    public static boolean isFullnameValid(String testString){
        return testString.matches(USER_FULLNAME_CHECK);
    }

    public static int calculateAge(LocalDate birthDate, LocalDate currentDate) {
        if ((birthDate != null) && (currentDate != null)) {
            return Period.between(birthDate, currentDate).getYears();
        } else {
            return 0;
        }
    }
}
