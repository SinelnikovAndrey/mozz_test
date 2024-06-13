import 'package:appwrite/appwrite.dart';

Client client = Client();
client
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('666053020014891fd972')
    .setSelfSigned(status: true); // For self signed certificates, only use for development