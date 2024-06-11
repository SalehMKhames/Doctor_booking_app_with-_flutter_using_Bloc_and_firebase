const String API_KEY = "AIzaSyBN-wrHljf8dpGyHEDpkFNYc0BpbNS61CQ";

const String BaseURL = "https://identitytoolkit.googleapis.com/v1";
const String SignUpURL = "$BaseURL/accounts:singUp?key=$API_KEY";
const String SignInURL = "$BaseURL/accounts:signInWithPassword?key=$API_KEY";
const String DeleteUserURL = "$BaseURL/accounts:delete?key=$API_KEY";
const String ChangingPassowrURL = "$BaseURL/accounts:update?key=$API_KEY";
const String GetUserURL = "$BaseURL/accounts:lookup?key=$API_KEY";

const String DataBaseURL ="https://doctory-app-38c91-default-rtdb.europe-west1.firebasedatabase.app/";

const String ResetPasswordSuccess='Your password changed successfully';
const String LogInSuccess='It\'s done, you just logged in';
const String RegisterSuccess='Your account has beent added successfully';
const String LogOut_Success='You just logged out from your account';
const String DeleteUserSuccess='Your account had been deleted successfully';

const String failure = "Something went wrong, please try again in few moments!";