import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Text('Email'),
                      subtitle: Text('darshanchavan@swift.com'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone_outlined),
                      title: Text('Phone'),
                      subtitle: Text('+1 (555) 123-4567'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text('Address'),
                      subtitle: Text('123 SwiftRide Street\nSan Francisco, CA 94105'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const ExpansionTile(
              title: Text('How do I make a booking?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'To make a booking, simply browse our available cars, select your desired dates and location, and proceed to payment. You\'ll receive a confirmation email once your booking is complete.',
                  ),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('What documents do I need?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'You\'ll need a valid driver\'s license, proof of insurance, and a credit card for the security deposit. International customers may need to provide additional documentation.',
                  ),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('What is the cancellation policy?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Cancellations made at least 24 hours before the rental start time are eligible for a full refund. Late cancellations or no-shows may be subject to charges.',
                  ),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('Is insurance included?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Basic insurance is included with all rentals. Additional coverage options are available during the booking process for enhanced protection.',
                  ),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('What happens if I return the car late?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Late returns may incur additional charges. Please contact our support team if you need to extend your rental period.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 