import 'package:car_ticket/domain/entities/user/user_entity.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
  });

  static MyUser empty = const MyUser(id: '', email: '', name: '');

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(id: id, email: email, name: name);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(id: entity.id, email: entity.email, name: entity.name);
  }

  @override
  List<Object?> get props => [id, email, name];
}
