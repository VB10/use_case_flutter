class EmptySampleInheritedUser {
  EmptySampleInheritedUser({
    required this.userName,
  });
  final String userName;
}

class EmptySampleUserRequest {
  EmptySampleUserRequest({
    required this.email,
    required this.password,
    required this.userName,
  });
  final String email;
  final String password;
  final String userName;
}
