import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('666053020014891fd972')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

Account account = Account(client);



//check user session is active or not
Future<bool> checkSessions() async {
  try {
    await account.getSession(sessionId: "current");
    return true;
  } catch (e) {
    return false;
  }
}

// Create a new user using email
Future<String> createUser(String name, String email, String password) async {
  try {
    await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    return "все получилось!";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Login and create new session
Future<String> loginUser(String email, String password) async {
  try {
    await account.createEmailPasswordSession(email: email, password: password);
    return "успешно";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}



// logout the user delete the session
Future logoutUser() async {
  await account.deleteSession(sessionId: "current");
}

// get details of the user logged in
Future<User?> getUser() async {
  try {
    final user = await account.get();
    return user;
  } catch (e) {
    return null;
  }
}

// send verification mail to the user
Future<bool> sendVerificationMail() async {
  try {
    await account.createVerification(
        url:
        "https://reset-password-and-verify-email-appwrite.onrender.com/verify");
    return true;
  } catch (e) {
    return false;
  }
}

// send recovery mail to the user
Future<bool> sendRecoveryMail(String email) async {
  try {
    await account.createRecovery(
        email: email,
        url:
        "https://reset-password-and-verify-email-appwrite.onrender.com/recovery");
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

