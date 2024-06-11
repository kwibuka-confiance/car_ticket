import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const UserItem(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('$firstName $lastName'),
              subtitle: Text(email),
              trailing: Text(phone),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('View Profile'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Change Role'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
