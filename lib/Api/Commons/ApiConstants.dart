class ApiConstants {
    static const String baseUrl = 'http://192.168.1.196:4000/parisjanitor-api/';
    static const String usersUrl = '${baseUrl}users/';
    static const String signUpUrl = '${baseUrl}users';
    static const String usersByMailUrl = '${usersUrl}email/';
    static const String userInfoUrl = '${usersUrl}me';
    static const String updateUserUrl = '${usersUrl}update';
    static const String loginUrl = '${usersUrl}log';


}