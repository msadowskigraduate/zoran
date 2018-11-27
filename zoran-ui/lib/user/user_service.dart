import 'package:angular/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

part 'user_service.g.dart';

const zoranIoUrl = const OpaqueToken<String>('zoranBaseUrl');

class UserService {
  final Logger logger = new Logger('ZoranService');
  final String _baseUrl = zoranIoUrl.toString();
  UserDto user;

  UserDto isAuthenticated()  {
    try {
      final url = '$_baseUrl/app/version';
//      final response = await HttpRequest.getString(url);
//      return new UserDto.fromJson(json.decode(response));
      user = new UserDto("login", "FakeName", "ACTIVE", "fak"
          "e@fake.com",
          "https://media.istockphoto.com/photos/businessman-silhouette-as-avatar-or-default-profile-picture-picture-id476085198",
          "github.com", "fake.com", "USER", "10-10-2010");
      print(user.name);
      return this.user;
    } catch (e, s) {
      logger.severe(e, s);
      rethrow;
    }
  }
}

@JsonSerializable(createToJson: false)
class UserDto {
  final String login;
  final String name;
  final String state;
  final String email;
  final String avatarUrl;
  final String repoUrl;
  final String htmlUrl;
  final String userType;
  final String lastLogin;

  UserDto(this.login, this.name, this.state, this.email, this.avatarUrl,
      this.repoUrl, this.htmlUrl, this.userType, this.lastLogin);

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}