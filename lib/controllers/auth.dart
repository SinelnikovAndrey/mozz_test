import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('666053020014891fd972')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

Account account = Account(client);

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
