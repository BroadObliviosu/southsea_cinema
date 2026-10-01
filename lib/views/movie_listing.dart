import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  //means that values can update while its running
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _quantity = 1;
  String _feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),

      body: Container(
        child: Column(
          children:  [
            //const means the value wont change
            const Text(
              'Dracula (1931) (PG)',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              
              ),
              const SizedBox(height: 20),

            const Text (
              'Southsea Cinema Room',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
              ),
              const SizedBox(height: 20),

            const Text (
              'Thursday 22nd Oct 2026, 18:00 - ends at 19:14',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
              ),
              const SizedBox(height: 20),

            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _quantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),

            ElevatedButton(
              onPressed:() {
                setState(() {
                  _feedback = '$_quantity ticket(s) added to order.';
                });
              },
              child: const Text('Add to Order'),
            ),
            Text(_feedback),

          ],

        ),
      ),
    );
  }
}
