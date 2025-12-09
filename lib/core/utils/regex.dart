const String emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const String passwordRegex = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[^\s\r\n]{8,}$';
const String passwordStrongRegex = r'^(?=.+\d)(?=.+[a-zA-Z])(?=.+[_@$!%*#?&\-+])[\da-zA-Z_@$!%*#?&\-+]{8,}$';
const String indonesianHandphoneNumberRegex = r'^08[\d]{8,18}$';
const String indonesianPhoneNumberRegex = r'^(\+62|62|0)([2-7]|9)\d(\d)?[2-9](\d){6,7}$';
const String noSymbolRegex = r'[^\w\s]+';