import 'package:car_ticket/presentation/widgets/dashboard/user_card.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            title: const Text('Users'),
            floating: true,
            snap: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 200,
            foregroundColor: Colors.white,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.8)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text('Add User',
                              style: TextStyle(color: Colors.white)),
                        ))))),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: const Row(
                  children: [
                    Text('All Users',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const UserItem(
                          firstName: "Kwibuka",
                          lastName: "Confiance",
                          email: "djconfiance",
                          phone: "+25078239102");
                    }),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
