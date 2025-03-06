// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:advance_budget_request_system/views/tripEntry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TripInfo extends StatefulWidget {
  const TripInfo({super.key});

  @override
  State<TripInfo> createState() => _TripInfoState();
}

class _TripInfoState extends State<TripInfo> {
  List<Map<String, dynamic>> tripData = [
    {
      'Date': '2023-10-28',
      'tripID': '1',
      'description': 'Job Training',
      'Total Amount': '200000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-10-29',
      'tripID': '2',
      'description': 'Camping',
      'Total Amount': '500000',
      'currency': 'MMK',
      'department': 'HR',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-10-30',
      'tripID': '3',
      'description': 'Trip',
      'Total Amount': '700000',
      'currency': 'MMK',
      'department': 'Marketing',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-10-31',
      'tripID': '4',
      'description': 'Oversea',
      'Total Amount': '400000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2025-02-04',
      'tripID': '5',
      'description': 'Oversesa meeting',
      'Total Amount': '500000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2025-02-05',
      'tripID': '6',
      'description': 'Mandalay site vist',
      'Total Amount': '300000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2025-02-06',
      'tripID': '7',
      'description': 'Trip',
      'Total Amount': '100000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2025-10-28',
      'tripID': '8',
      'description': 'Oversea',
      'Total Amount': '300000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-01',
      'tripID': '9',
      'description': 'Camping',
      'Total Amount': '200000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-02',
      'tripID': '10',
      'description': 'Training',
      'Total Amount': '800000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-03',
      'tripID': '11',
      'description': 'Trip',
      'Total Amount': '300000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-04',
      'tripID': '12',
      'description': 'Oversea',
      'Total Amount': '400000',
      'currency': 'MMK',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-05',
      'tripID': '13',
      'description': 'Site visit',
      'Total Amount': '500000',
      'currency': 'MMK',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-06',
      'tripID': '14',
      'description': 'Training',
      'Total Amount': '200000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-11-07',
      'tripID': '15',
      'description': 'Oversea',
      'Total Amount': '300000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
    {
      'Date': '2023-10-8',
      'tripID': '16',
      'description': 'Camping',
      'Total Amount': '100000',
      'currency': 'MMK',
      'department': 'Admin',
      "BudgetDetails": [
        {"Budget Code": "B0001", "Description": "For Marketing"},
        {"Budget Code": "B11123", "Description": "Expenses"},
      ],
    },
  ];

  final List<Map<String, dynamic>> BudgetDetails = [
    {'Budget Code': 'B001', 'Description': 'Marketing Campaign'},
    {'Budget Code': 'B002', 'Description': 'Short Trip'},
    {'Budget Code': 'B003', 'Description': 'Foreign Trip'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
  ];

  List<Map<String, dynamic>> filteredData = [];

  final TextEditingController _searchController = TextEditingController();

  String? selectedDate;
  DateTimeRange? CustomDateRange;
  DateTimeRange? selectedDateRange;
  DateTime? startDate;
  DateTime? endDate;

  String? sortColumn;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    filteredData = List.from(tripData);
  }

  // Date filter
  // ignore: unused_element
  String _getDateFilterDisplayName(String value) {
    switch (value) {
      case 'today':
        return 'Today';
      case 'this_week':
        return 'This week';
      case 'this_month':
        return 'This month';
      case 'this_year':
        return 'This year';
      case 'custom_date':
        return 'Custom Date';

      default:
        return value;
    }
  }

  String _getThisWeekRange() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return '${DateFormat.yMd().format(startOfWeek)} - ${DateFormat.yMd().format(endOfWeek)}';
  }

  String _getThisMonthRange() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
    return '${DateFormat.yMd().format(startOfMonth)} - ${DateFormat.yMd().format(endOfMonth)}';
  }

  String _getThisYearRange() {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year, 1, 1);
    DateTime endOfYear = DateTime(now.year, 12, 31);
    return '${DateFormat.yMd().format(startOfYear)} - ${DateFormat.yMd().format(endOfYear)}';
  }

  void _filterByCustomDate(DateTimeRange chooseDateRange) {
    _filterDataByDateRange(chooseDateRange);
  }

  void _filterDataByDateRange(DateTimeRange dateRange) {
    setState(() {
      filteredData = tripData.where((data) {
        final dateString = data['Date'];
        if (dateString == null) return false;
        final DateTime? dataDate =
            dateString is DateTime ? dateString : DateTime.tryParse(dateString);
        if (dataDate == null) return false;
        return dataDate
                .isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
            dataDate.isBefore(dateRange.end.add(const Duration(days: 1)));
      }).toList();
    });
  }

  void _filterByPresetDate(String filterType) {
    DateTime now = DateTime.now();
    DateTimeRange? dateRange;

    switch (filterType) {
      case 'today':
        dateRange = DateTimeRange(start: now, end: now);
        break;
      case 'this_week':
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        dateRange = DateTimeRange(start: startOfWeek, end: endOfWeek);
        break;
      case 'this_month':
        DateTime startOfMonth = DateTime(now.year, now.month, 1);
        DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
        dateRange = DateTimeRange(start: startOfMonth, end: endOfMonth);
        break;
      case 'this_year':
        DateTime startOfYear = DateTime(now.year, 1, 1);
        DateTime endOfYear = DateTime(now.year, 12, 31);
        dateRange = DateTimeRange(start: startOfYear, end: endOfYear);
        break;

      default:
        return;
    }
    // ignore: unnecessary_null_comparison
    if (dateRange != null) {
      setState(() {
        selectedDate = filterType;
      });
      _filterDataByDateRange(dateRange);
    }
  }

  void _showCustomDateRangeDialog(BuildContext context) {
    DateTime initialStartDate = DateTime.now();
    DateTime initialEndDate = DateTime.now();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Choose Custom Date"),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Select Start Date: "),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? chooseStartDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (chooseStartDate != null) {
                          setState(() {
                            initialStartDate = chooseStartDate;
                          });
                        }
                      },
                      child: Text(DateFormat.yMd().format(initialStartDate))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Select End Date: '),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? chooseEndDate = await showDatePicker(
                            context: context,
                            initialDate: initialEndDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (chooseEndDate != null) {
                          setState(() {
                            initialEndDate = chooseEndDate;
                          });
                        }
                      },
                      child: Text(DateFormat.yMd().format(initialEndDate)))
                ],
              );
            }),
            actions: [
              TextButton(
                  onPressed: () {
                    if (initialStartDate.isBefore(initialEndDate) ||
                        initialStartDate.isAtSameMomentAs(initialEndDate)) {
                      setState(() {
                        CustomDateRange = DateTimeRange(
                            start: initialStartDate, end: initialEndDate);
                        selectedDate = 'custom_date';
                      });
                      _filterByCustomDate(CustomDateRange!);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please choose available Dates.")));
                    }
                  },
                  child: const Text("Apply")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ],
          );
        });
  }

  //Search function
  void _searchData(String query) {
    setState(() {
      List<Map<String, dynamic>> sourceData = tripData;
      filteredData = sourceData.where((Map<String, dynamic> data) {
        final tripID = data['tripID'].toLowerCase();
        final description = data['description'].toLowerCase();
        final totalAmt = data['Total Amount'];
        final currency = data['currency'].toLowerCase();
        final department = data['department'].toLowerCase();
        final String searchLower = query.toLowerCase();

        return tripID.contains(searchLower) ||
            description.contains(searchLower) ||
            totalAmt.contains(searchLower) ||
            currency.contains(searchLower) ||
            department.contains(searchLower);
      }).toList();
    });
  }

  //sorting function
  void _sortDataColumn(String column) {
    setState(() {
      if (sortColumn == column) {
        sortAscending = !sortAscending;
      } else {
        sortColumn = column;
        sortAscending = true;
      }

      filteredData.sort((a, b) {
        final aValue = a[column];
        final bValue = b[column];
        if (aValue == null || bValue == null) return 0;

        if (sortAscending) {
          return aValue.compareTo(bValue);
        } else {
          return bValue.compareTo(aValue);
        }
      });
    });
  }

  Widget _buildHeaderCell(String label, String column) {
    return InkWell(
      onTap: () {
        _sortDataColumn(column);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (sortColumn == column)
              Icon(
                sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
              )
          ],
        ),
      ),
    );
  }

  //Delete
  void _deleteConfirmation(int index) async {
    bool? confirm = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete Confirmation"),
            content: const Text("Are you sure to delete this Trip Data?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Delete")),
            ],
          );
        });

    if (confirm != null && confirm) {
      setState(() {
        tripData.removeAt(index);
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Trip Data is deleted successfully")));
    }
  }

  //refresh Data
  void _refreshData() {
    setState(() {
      _searchController.clear();
      selectedDateRange = null;
      selectedDate = null;
      startDate = null;
      endDate = null;
      filteredData = tripData;
      sortColumn=null;
      sortAscending=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> filteredTrip = tripData.where((trip) {
    //   return filteredData.every((filter) => trip.values.contains(filter));
    // }).toList();
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Trip Request Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                // width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownButton(
                      value: selectedDate,
                      hint: const Text('Filter by Date'),
                      items: [
                        DropdownMenuItem(
                            value: 'today',
                            child: Tooltip(
                              message: DateFormat.yMd().format(DateTime.now()),
                              child: const Text('Today'),
                            )),
                        DropdownMenuItem(
                            value: 'this_week',
                            child: Tooltip(
                              message: _getThisWeekRange(),
                              child: const Text('This Week'),
                            )),
                        DropdownMenuItem(
                            value: 'this_month',
                            child: Tooltip(
                              message: _getThisMonthRange(),
                              child: const Text('This Month'),
                            )),
                        DropdownMenuItem(
                            value: 'this_year',
                            child: Tooltip(
                              message: _getThisYearRange(),
                              child: const Text('This Year'),
                            )),
                        DropdownMenuItem(
                            value: 'custom_date',
                            child: Tooltip(
                              message: CustomDateRange != null
                                  ? '${DateFormat.yMd().format(CustomDateRange!.start)} - ${DateFormat.yMd().format(CustomDateRange!.end)}'
                                  : 'Choose a Custom Date Range',
                              child: const Text('Custom Date'),
                            )),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDate = newValue;
                          if (newValue == 'custom_date') {
                            _showCustomDateRangeDialog(context);
                          } else if (newValue != null) {
                            _filterByPresetDate(newValue);
                          }
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _searchData,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  // width: MediaQuery.of(context).size.width*0.1,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 150, 212, 234),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final List<Map<String, dynamic>>? newTrip =
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddTrip(onTripAdded: (newTrip) {
                                          setState(() {
                                            _refreshData();
                                            tripData.addAll(newTrip);
                                          });
                                        })));
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        _refreshData();
                      },
                      icon: const Icon(Icons.refresh),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              child: Table(
                border: const TableBorder.symmetric(
                  inside: BorderSide(color: Colors.grey, width: 1),
                  outside: BorderSide(color: Colors.grey, width: 1),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(0.6),
                  1: FlexColumnWidth(0.5),
                  2: FlexColumnWidth(1.9),
                  3: FlexColumnWidth(0.8),
                  4: FlexColumnWidth(0.5),
                  5: FlexColumnWidth(0.6),
                  6: FlexColumnWidth(0.7)
                },
                children: [
                  TableRow(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 167, 230, 232)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _buildHeaderCell("Request Date", "Date"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Trip Code", "tripID"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell(
                              "Trip Description", "description"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _buildHeaderCell("Total Amount", "Total Amount"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Currency", "currency"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Department", "department"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Action",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              // height: 500,
              child: Table(
                border: const TableBorder.symmetric(
                  inside: BorderSide(color: Colors.grey, width: 1),
                  outside: BorderSide(color: Colors.black, width: 1),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(0.6),
                  1: FlexColumnWidth(0.5),
                  2: FlexColumnWidth(1.9),
                  3: FlexColumnWidth(0.8),
                  4: FlexColumnWidth(0.5),
                  5: FlexColumnWidth(0.6),
                  6: FlexColumnWidth(0.7),
                },
                children: filteredData.asMap().entries.map((entry) {
                  int index = entry.key;
                  var row = entry.value;
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row['Date']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row['tripID'] ?? '1'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row['description'] ?? 'fd'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row['Total Amount'] ?? '0'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row['currency'] ?? 'USD'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row['department'] ?? 'HR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTrip(
                                      tripData: tripData[index],
                                      onTripUpdated: (updatedTrip) {
                                        setState(() {
                                          _refreshData();
                                          tripData[index] = updatedTrip;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit),
                              color: Colors.black),
                          IconButton(
                              onPressed: () {
                                _deleteConfirmation(tripData.indexOf(row));
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.black),
                          IconButton(
                            icon: const Icon(Icons.more_horiz_outlined,
                                color: Colors.black),
                            onPressed: () {
                              String selectedBudgetCode =
                                  tripData[index]["Budget Code"] ?? "N/A";

                              List<String> selectedBudgetCodes = [];
                              var rawBudgetCodes =
                                  tripData[index]["Budget Code"];
                              if (rawBudgetCodes is String) {
                                selectedBudgetCodes = rawBudgetCodes
                                    .split(',')
                                    .map((e) => e.trim())
                                    .toList();
                              } else if (rawBudgetCodes is List) {
                                selectedBudgetCodes =
                                    List<String>.from(rawBudgetCodes);
                              }

                              List<Map<String, dynamic>> budgetDetails = [];

                              if (selectedBudgetCodes.isNotEmpty) {
                                budgetDetails = BudgetDetails.where((budget) =>
                                    selectedBudgetCodes.contains(
                                        budget["Budget Code"])).toList();
                              } else if (selectedBudgetCode != "N/A") {
                                budgetDetails = BudgetDetails.where((budget) =>
                                    budget["Budget Code"] ==
                                    selectedBudgetCode).toList();
                              }

                              // If no matching budget details are found, add a fallback entry
                              if (budgetDetails.isEmpty) {
                                budgetDetails = [
                                  {
                                    "Budget Code": "N/A",
                                    "Description": "No budget details available"
                                  }
                                ];
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailTrip(
                                    tripData: tripData[index],
                                    selectedBudgetCode: selectedBudgetCode,
                                    selectedBudgetCodes: budgetDetails,
                                    budgetDetails: budgetDetails,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

//Detail Trip

class DetailTrip extends StatefulWidget {
  final Map<String, dynamic> tripData;
  final List<Map<String, dynamic>> selectedBudgetCodes;
  final String selectedBudgetCode;
  final List<Map<String, dynamic>> budgetDetails;

  const DetailTrip(
      {super.key,
      required this.tripData,
      required this.selectedBudgetCodes,
      required this.selectedBudgetCode,
      required this.budgetDetails});

  @override
  State<DetailTrip> createState() => _DetailTripState();
}

class _DetailTripState extends State<DetailTrip> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> budgetDetails = [];
    if (widget.tripData["BudgetDetails"] != null) {
      if (widget.tripData["BudgetDetails"] is String) {
        budgetDetails = _parseBudgetDetails(widget.tripData["BudgetDetails"]);
      } else if (widget.tripData["BudgetDetails"] is List) {
        budgetDetails =
            List<Map<String, String>>.from(widget.tripData["BudgetDetails"]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Details"),
        backgroundColor: const Color.fromRGBO(100, 207, 198, 0.855),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("Trip Code", widget.tripData["tripID"], "Amount",
                widget.tripData["Total Amount"]),
            const SizedBox(height: 10),
            _buildRow("Description", widget.tripData["description"], "Currency",
                widget.tripData["currency"]),
            const SizedBox(height: 10),
            _buildRow("Date", widget.tripData["Date"], "Name",
                widget.tripData["Name"] ?? 'May'),
            const SizedBox(height: 10),
            _buildRow("Department", widget.tripData["department"], "",
                widget.tripData[""]),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            const Text("Budget Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 40,
            ),
            _buildBudgetTable(),
            const SizedBox(height: 40),
            Center(
                child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
      String label1, String value1, String label2, String? value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInlineText(label1, value1),
          if (label2.isNotEmpty) _buildInlineText(label2, value2 ?? "N/A"),
        ],
      ),
    );
  }

  Widget _buildInlineText(String label, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                  text: "$label: ",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetTable() {
    return Table(
      border: TableBorder.all(),
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Budget Code",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Description",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        ...widget.budgetDetails.map((budget) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(budget["Budget Code"]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(budget["Description"]),
                ),
              ],
            )),
      ],
    );
  }
}

Widget _buildTableCell(String text, {bool isHeader = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 16,
      ),
    ),
  );
}

List<Map<String, String>> _parseBudgetDetails(String budgetDetails) {
  try {
    // Replace single quotes with double quotes for JSON parsing
    String formattedString = budgetDetails.replaceAll("'", '"');
    // Parse the JSON string into a List of Maps
    List<dynamic> parsedList = jsonDecode(formattedString);
    // Convert to List<Map<String, String>>
    return parsedList.map((item) => Map<String, String>.from(item)).toList();
  } catch (e) {
    print("Error parsing BudgetDetails: $e");
    return [];
  }
}
