import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ChatAuthUser {
  ChatAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ChatAuthUser> chatAuthUserSubject =
    BehaviorSubject.seeded(ChatAuthUser(loggedIn: false));
Stream<ChatAuthUser> chatAuthUserStream() =>
    chatAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
