import 'package:flutter/material.dart';

class TicketBuyingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Buying'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add logic for ticket purchase
            // After successful purchase, you can navigate to a confirmation page
          },
          child: Text('Purchase Ticket'),
        ),
      ),
    );
  }
}
