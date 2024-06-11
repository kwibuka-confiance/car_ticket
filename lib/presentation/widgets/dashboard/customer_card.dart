import 'package:flutter/material.dart';

class CustomerItem extends StatelessWidget {
  const CustomerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Kwibuka Confiance'),
              subtitle: Text('dconfy@gmail.com'),
              trailing: Text('0783492031'),
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
                    child: const Text('View Tickets'),
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
