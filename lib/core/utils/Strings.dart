const String API_KEY = "AIzaSyBN-wrHljf8dpGyHEDpkFNYc0BpbNS61CQ";

const String BaseURL = "https://identitytoolkit.googleapis.com/v1";
const String SignUpURL = "$BaseURL/accounts:singUp?key=$API_KEY";
const String SignInURL = "$BaseURL/accounts:signInWithPassword?key=$API_KEY";
const String DeleteUserURL = "$BaseURL/accounts:delete?key=$API_KEY";
const String ChangingPassowrURL = "$BaseURL/accounts:update?key=$API_KEY";
const String GetUserURL = "$BaseURL/accounts:lookup?key=$API_KEY";

const String DataBaseURL ="https://doctory-app-38c91-default-rtdb.europe-west1.firebasedatabase.app/";

const  AddUserSuccess='The  User have been added Successfully';
const  DeleteUserSuccess='The  User have been deleted Successfully';
const  UpdateUserSuccess='The  User have been changed Successfully';

const  LogInSuccess='LogIn have done Successfully';
const  RegisterSuccess='Register have done Successfully';
const  LogOut_Success='LogOut Have been Completed Successfully';
