import 'package:flutter/material.dart';
import 'package:swiftride/models/car.dart';
import 'package:swiftride/data/dummy_data.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Booking> _bookings;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initializeBookings();
  }

  void _initializeBookings() {
    // Sample bookings for demonstration
    _bookings = [
      // Upcoming bookings
      Booking(
        id: '1001',
        car: featuredCars[0], // Tesla Model 3
        startDate: DateTime.now().add(const Duration(days: 2)),
        endDate: DateTime.now().add(const Duration(days: 4)),
        totalAmount: 599.97,
        city: 'Mumbai',
      ),
      Booking(
        id: '1002',
        car: featuredCars[5], // Lamborghini Urus
        startDate: DateTime.now().add(const Duration(days: 7)),
        endDate: DateTime.now().add(const Duration(days: 9)),
        totalAmount: 1499.97,
        city: 'Delhi',
      ),
      // Past bookings
      Booking(
        id: '1003',
        car: featuredCars[2], // Ford Mustang GT
        startDate: DateTime.now().subtract(const Duration(days: 10)),
        endDate: DateTime.now().subtract(const Duration(days: 8)),
        totalAmount: 539.97,
        city: 'Bangalore',
      ),
      Booking(
        id: '1004',
        car: featuredCars[8], // Mercedes G-Wagon
        startDate: DateTime.now().subtract(const Duration(days: 20)),
        endDate: DateTime.now().subtract(const Duration(days: 18)),
        totalAmount: 1199.97,
        city: 'Chh.Sambhajinagar',
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBookingList(_bookings.where((booking) => booking.endDate.isAfter(DateTime.now())).toList()),
          _buildBookingList(_bookings.where((booking) => booking.endDate.isBefore(DateTime.now())).toList()),
        ],
      ),
    );
  }

  Widget _buildBookingList(List<Booking> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.car_rental,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No bookings found',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    booking.car.brand[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('${booking.car.brand} ${booking.car.name}'),
                subtitle: Text('Booking ID: #${booking.id}'),
                trailing: Text(
                  '\$${booking.totalAmount}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(height: 0),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Start Date',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${booking.startDate.day}/${booking.startDate.month}/${booking.startDate.year}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'End Date',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${booking.endDate.day}/${booking.endDate.month}/${booking.endDate.year}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'City',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            booking.city,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Booking {
  final String id;
  final Car car;
  final DateTime startDate;
  final DateTime endDate;
  final double totalAmount;
  final String city;

  Booking({
    required this.id,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.totalAmount,
    required this.city,
  });
} 