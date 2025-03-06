import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ProjectEntry extends StatefulWidget {
  const ProjectEntry({super.key});

  @override
  State<ProjectEntry> createState() => _ProjectEntryState();
}

class _ProjectEntryState extends State<ProjectEntry> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class EntryForm extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onProjectAdded;

  const EntryForm({Key? key, required this.onProjectAdded}) : super(key: key);
  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  List<Map<String, dynamic>> filterData = [];
  final _formkey = GlobalKey<FormState>();

  //final TextEditingController dateController=TextEditingController();
  final TextEditingController projectController = TextEditingController();

  final TextEditingController desciptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  List<Map<String, dynamic>> chooseBudgetCodes = [];
  final List<Map<String, dynamic>> BudgetDetails = [
    {'Budget Code': 'B001', 'Description': 'Marketing Campaign'},
    {'Budget Code': 'B002', 'Description': 'Short Trip'},
    {'Budget Code': 'B003', 'Description': 'Foreign Trip'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B005', 'Description': 'On Job Training'},
    {'Budget Code': 'B006', 'Description': 'On Job Training'},
    {'Budget Code': 'B007', 'Description': 'On Job Training'},
    {'Budget Code': 'B008', 'Description': 'On Job Training'},
    {'Budget Code': 'B009', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
  ];
 Map<String, String> getBudgetDetail(String code) {
    final budget = BudgetDetails.firstWhere(
      (item) => item['Budget Code'] == code,
      orElse: () => {'Budget Code': 'N/A', 'Description': 'No budget details available'},
    );
    return {'code': budget['Budget Code']!, 'description': budget['Description']!};
  }
  //Budget Alert Dialog
//Budget Alert Dialog
  void _showBudgetCodeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 16.0, right: 16.0, bottom: 14.0),
                child: Column(
                  children: [
                    const Text(
                      "Select Budget Code",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: DataTable(
                            showCheckboxColumn: false,
                            columns: const [
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("Budget Code")),
                              DataColumn(label: Text("Description")),
                            ],
                            rows: BudgetDetails.map((budgetCode) {
                              bool isSelected = chooseBudgetCodes.any((code) =>
                                  code['Budget Code'] ==
                                  budgetCode['Budget Code']);

                              return DataRow(
                                cells: [
                                  DataCell(
                                    isSelected
                                        ? IconButton(
                                            icon: const Icon(Icons.check_circle,
                                                color: Colors.green),
                                            onPressed: () {
                                              setState(() {
                                                chooseBudgetCodes.removeWhere(
                                                    (code) =>
                                                        code['Budget Code'] ==
                                                        budgetCode[
                                                            'Budget Code']);
                                              });
                                              Navigator.pop(context);
                                              _showBudgetCodeDialog(); // Refresh the dialog
                                            },
                                          )
                                        : const SizedBox
                                            .shrink(), // Show nothing if not selected
                                  ),
                                  DataCell(Text(budgetCode['Budget Code'])),
                                  DataCell(Text(budgetCode['Description'])),
                                ],
                                onSelectChanged: (selected) {
                                  if (selected != null && selected) {
                                    if (isSelected) {
                                      // Show error message if the budget code is already selected
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "This budget code is already selected."),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        chooseBudgetCodes.add(budgetCode);
                                      });
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteBudgetCode(int index) {
    setState(() {
      chooseBudgetCodes.removeAt(index);
    });
  }

  String? _selectedDepartment;
  String? selectedBudgetCode;
  String _selectedCurrency = "MMK";
  //String? _selectedRequestable='No';
  final List<String> _departments = [
    'HR',
    'IT',
    'Finance',
    'Admin',
    'Production',
    'Engineering',
    'Marketing',
    'Sales'
  ];
  // ignore: unused_field
  final List<String> _currencies = ['MMK', 'USD'];
  //final List<String> _requestable=['Yes','No'];

  void _clearText() {
    setState(() {
      projectController.text = "";
      desciptionController.text = "";
      amountController.text = "";
      _selectedDepartment = null;
      _selectedCurrency = 'MMK';
    });
  }

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      List<Map<String, dynamic>> newProject = [
        {
          "Date": dateController.text,
          "ProjectID": projectController.text,
          "Description": desciptionController.text,
          "Total Budget Amount": amountController.text,
          "Currency": _selectedCurrency,
          "Department": _selectedDepartment ?? '',
          "Requestable": 'No',
          "Budget Code": chooseBudgetCodes.isNotEmpty 
                        ? chooseBudgetCodes.map((e) => e['Budget Code']).join(",")
                        : '',

        }
      ];

      widget.onProjectAdded(newProject);

      Navigator.pop(context);
    }
  }

  void onProjectAdded(List<Map<String, dynamic>> newProjects) {
    setState(() {
      filterData.addAll(newProjects); // Ensure newProjects is a list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Request Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 149, 239, 233),
                borderRadius: BorderRadius.circular(15), // Rounded corners
                border:
                    Border.all(color: Colors.black, width: 1), // Border color
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Add Project Request',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  title: TextFormField(
                                    controller: projectController,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Project Code"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Project Code";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: TextFormField(
                                    controller: desciptionController,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Project Description"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Project Description";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: TextFormField(
                                    controller: amountController,
                                    decoration: const InputDecoration(
                                      labelText: "Enter Total Amount",
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d*\.?\d*')),
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Total Amount";
                                      }
                                      final amount = double.tryParse(value);
                                      if (amount == null) {
                                        return "Enter a valid amount";
                                      }
                                      if (amount <= 0) {
                                        return "Your Request Amount must be greater than 0";
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  title: TextFormField(
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                        labelText: "Request Date"),
                                    readOnly: true,
                                  ),
                                ),
                                ListTile(
                                  title: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Choose your Department",
                                    ),
                                    items: _departments.map((department) {
                                      return DropdownMenuItem(
                                          value: department,
                                          child: Text(department));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedDepartment = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Choose your Department";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: DropdownButtonFormField(
                                    decoration: const InputDecoration(),
                                    value: _selectedCurrency,
                                    items: ['MMK', 'USD'].map((currency) {
                                      return DropdownMenuItem(
                                          value: currency,
                                          child: Text(currency));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedCurrency = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: _showBudgetCodeDialog,
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15),
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Add Budget Code"),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  border: TableBorder.all(),
                                  showCheckboxColumn: false,
                                  columns: const [
                                    DataColumn(label: Text("Budget Code")),
                                    DataColumn(label: Text("Description")),
                                    DataColumn(label: Text("Action")),
                                  ],
                                  rows: chooseBudgetCodes.map((budgetCode) {
                                    final index =
                                        chooseBudgetCodes.indexOf(budgetCode);
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                            Text(budgetCode['Budget Code'])),
                                        DataCell(
                                            Text(budgetCode['Description'])),
                                        DataCell(
                                          IconButton(
                                            onPressed: () {
                                              _deleteBudgetCode(index);
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _submitForm();
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 15,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Submit"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _clearText();
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 15,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Clear"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}

class ProjectBudgetEntry extends StatefulWidget {
  @override
  _ProjectBudgetEntryFormState createState() => _ProjectBudgetEntryFormState();
}

class _ProjectBudgetEntryFormState extends State<ProjectBudgetEntry> {
  List<Map<String, String>> budgetData = [
    {"Budget Code": "", "Description": ""}
  ]; // First row is always there

  // Dummy budget selection data
  final List<Map<String, String>> availableBudgetCodes = [
    {"Budget Code": "B001", "Description": "Marketing Expenses"},
    {"Budget Code": "B002", "Description": "Travel Expenses"},
    {"Budget Code": "B003", "Description": "Office Supplies"},
  ];

  void _showBudgetSelectionDialog(int rowIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Budget Code"),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  border: TableBorder.all(),
                  columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      children: [
                        _buildTableCell("Budget Code", isHeader: true),
                        _buildTableCell("Description", isHeader: true),
                      ],
                    ),
                    for (var budget in availableBudgetCodes)
                      TableRow(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                budgetData[rowIndex] = {
                                  "Budget Code": budget["Budget Code"]!,
                                  "Description": budget["Description"]!
                                };

                                if (rowIndex == budgetData.length - 1) {
                                  budgetData.add(
                                      {"Budget Code": "", "Description": ""});
                                }
                              });
                              Navigator.pop(context);
                            },
                            child: _buildTableCell(budget["Budget Code"] ?? ""),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                budgetData[rowIndex] = {
                                  "Budget Code": budget["Budget Code"]!,
                                  "Description": budget["Description"]!
                                };

                                if (rowIndex == budgetData.length - 1) {
                                  budgetData.add(
                                      {"Budget Code": "", "Description": ""});
                                }
                              });
                              Navigator.pop(context);
                            },
                            child: _buildTableCell(budget["Description"] ?? ""),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteRow(int index) {
    setState(() {
      if (index == 0) {
        // First row can't be removed, only cleared
        budgetData[index] = {"Budget Code": "", "Description": ""};
      } else {
        budgetData.removeAt(index);
      }
    });
  }

  void _submitProject() {
    List<Map<String, String>> selectedBudgetData =
        budgetData.where((row) => row["Budget Code"]!.isNotEmpty).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProjectDetailScreen(budgetData: selectedBudgetData),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Entry Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Budget Codes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1)
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: [
                    _buildTableCell("Budget Code", isHeader: true),
                    _buildTableCell("Description", isHeader: true),
                    _buildTableCell("Action", isHeader: true),
                  ],
                ),
                for (int i = 0; i < budgetData.length; i++)
                  TableRow(
                    children: [
                      GestureDetector(
                        onTap: () => _showBudgetSelectionDialog(i),
                        child:
                            _buildTableCell(budgetData[i]["Budget Code"] ?? ""),
                      ),
                      GestureDetector(
                        onTap: () => _showBudgetSelectionDialog(i),
                        child:
                            _buildTableCell(budgetData[i]["Description"] ?? ""),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: i == 0
                            ? SizedBox.shrink()
                            : IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteRow(i),
                              ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitProject,
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  final List<Map<String, String>> budgetData;

  ProjectDetailScreen({required this.budgetData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selected Budget Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(),
              columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: [
                    _buildTableCell("Budget Code", isHeader: true),
                    _buildTableCell("Description", isHeader: true),
                  ],
                ),
                for (var row in budgetData)
                  TableRow(
                    children: [
                      _buildTableCell(row["Budget Code"] ?? ""),
                      _buildTableCell(row["Description"] ?? ""),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}
