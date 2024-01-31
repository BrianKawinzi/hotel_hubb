// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hotel_hubb/bargraph/individual_bar.dart';
import 'package:hotel_hubb/widgets/navigation_drawer.dart';
import 'package:hotel_hubb/widgets/progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //calculate revenue method
  Future<double> calculateTotalRevenue() async {
    double totalRevenue = 0;

    List<double> monthlyAmounts = [
      10000,
      20000,
      15000,
      25000,
      18000,
      22000,
      30500,
      28000,
      35000,
      32000,
      28000,
      40000
    ];

    for (double amount in monthlyAmounts) {
      totalRevenue += amount;
    }

    return totalRevenue;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(233, 255, 179, 0),
        elevation: 10.0,
        title: const Row(
          children: [

            //Hotel name token will be taken from api
            Padding(
              padding: EdgeInsets.only(right: 13),
              child: Text(
                'Kanini Kaseo Hotel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          //Notification button
          IconButton(
            onPressed: () {

            }, 
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),


          //help button
          IconButton(
            onPressed: () {
              //handle help logic
            },
            icon: const Icon(
              Icons.help_outline_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),

      drawer: const Drawer(
        child: NavigationDrawerWidget(),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //sales card
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sales',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      const Text(
                        'Sales Information',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      //progress indicator
                      buildHorizontalProgressIndicators(
                        'Daily Sales', 
                        74, 
                        Colors.purple, 
                        'Monthly Sales', 
                        53, 
                        Colors.green,
                      ),

                      buildHorizontalProgressIndicators(
                        'Annual Sales', 
                        45, 
                        Colors.yellow, 
                        'Target Sales', 
                        82, 
                        const Color.fromARGB(255, 38, 0, 255),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //revenue card
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total \n Revenue',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                          ),


                          //calculation of monthly amounts
                          FutureBuilder<double>(
                            future: calculateTotalRevenue(),
                            builder: (context, snaphot) {
                              if (snaphot.hasData) {
                                return Text(
                                  'KSH \n ${snaphot.data!.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Text(
                                  'Loading...',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),

                          DropdownButton<String>(
                            items: <String>[
                              '2022',
                              '2023',
                              '2024',
                              '2025',
                              '2026',
                              '2027'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              //Handle dropdown value change logic
                            },
                            value: '2024',
                          ),
                        ],
                      ),

                      //Barchart
                      Container(
                        height: 200,
                        child: const IndividualBar(
                          x: 1, 
                          monthlyAmounts: [
                            10000,
                            20000,
                            15000,
                            25000,
                            18000,
                            22000,
                            30500,
                            28000,
                            35000,
                            32000,
                            28000,
                            40000
                          ]
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}