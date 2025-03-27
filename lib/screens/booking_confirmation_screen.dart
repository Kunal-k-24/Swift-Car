import 'package:flutter/material.dart';
import 'package:swiftride/models/car.dart';
import 'package:swiftride/screens/booking_history_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Car car;
  final DateTime startDate;
  final DateTime endDate;
  final String city;
  final double totalAmount;

  const BookingConfirmationScreen({
    super.key,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 96,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Booking Confirmed!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your car rental has been successfully booked.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Booking Details',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildDetailRow(
                              context,
                              'Car',
                              '${car.brand} ${car.name}',
                              Icons.directions_car,
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow(
                              context,
                              'Location',
                              city,
                              Icons.location_on,
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow(
                              context,
                              'Start Date',
                              '${startDate.day}/${startDate.month}/${startDate.year}',
                              Icons.calendar_today,
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow(
                              context,
                              'End Date',
                              '${endDate.day}/${endDate.month}/${endDate.year}',
                              Icons.calendar_today,
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow(
                              context,
                              'Total Amount',
                              '₹${totalAmount.toStringAsFixed(2)}',
                              Icons.payment,
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow(
                              context,
                              'Booking ID',
                              '#${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                              Icons.confirmation_number,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.info_outline, color: Colors.blue),
                                const SizedBox(width: 8),
                                Text(
                                  'Important Information',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '• Please bring your driver\'s license and credit card used for booking\n'
                              '• Check-in time is flexible on the start date\n'
                              '• The car should be returned with a full tank of fuel\n'
                              '• Contact support for any assistance during your rental period',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingHistoryScreen(),
                          ),
                          (route) => route.isFirst,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('View Bookings'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 