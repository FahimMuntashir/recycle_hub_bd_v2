// import 'package:recycle_hub_bd/users/user_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UserRepository {
//   final SupabaseClient _client = Supabase.instance.client;

//   Stream<List<Users>> getAllUsers() {
//     final users = _client.from('users').stream(primaryKey: ['id']).map((event) {
//       return event.map((e) {
//         return Users.fromJson(e);
//       }).toList();
//     });

//     return users;
//   }

//   Future addUsers(Users users) async {
//     await _client.from('users').insert(users);
//   }
// }
