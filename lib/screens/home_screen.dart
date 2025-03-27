import 'package:flutter/material.dart';
import 'package:swiftride/models/car.dart';
import 'package:swiftride/widgets/car_category_card.dart';
import 'package:swiftride/widgets/featured_car_card.dart';
import 'package:swiftride/data/dummy_data.dart';
import 'package:swiftride/screens/profile_screen.dart';
import 'package:swiftride/screens/search_screen.dart';
import 'package:swiftride/screens/booking_history_screen.dart';
import 'package:swiftride/screens/help_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        ).then((_) {
          setState(() {
            _selectedIndex = 0;
          });
        });
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookingHistoryScreen()),
        ).then((_) {
          setState(() {
            _selectedIndex = 0;
          });
        });
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpScreen()),
        ).then((_) {
          setState(() {
            _selectedIndex = 0;
          });
        });
      }
    });
  }

  void _filterByCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(initialCategory: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SwiftRide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CarCategoryCard(
                      icon: Icons.car_rental,
                      title: 'Economy',
                      color: Colors.green,
                      onTap: () => _filterByCategory('Economy'),
                    ),
                    const SizedBox(width: 12),
                    CarCategoryCard(
                      icon: Icons.directions_car,
                      title: 'SUV',
                      color: Colors.blue,
                      onTap: () => _filterByCategory('SUV'),
                    ),
                    const SizedBox(width: 12),
                    CarCategoryCard(
                      icon: Icons.star,
                      title: 'Luxury',
                      color: Colors.purple,
                      onTap: () => _filterByCategory('Luxury'),
                    ),
                    const SizedBox(width: 12),
                    CarCategoryCard(
                      icon: Icons.speed,
                      title: 'Sports',
                      color: Colors.red,
                      onTap: () => _filterByCategory('Sports'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Cars',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchScreen()),
                      );
                    },
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: featuredCars.length > 5 ? 5 : featuredCars.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: FeaturedCarCard(car: featuredCars[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
        ],
      ),
    );
  }
} 