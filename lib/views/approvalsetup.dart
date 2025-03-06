import 'package:flutter/material.dart';

class ApprovalSetup extends StatefulWidget {
  @override
  _ApprovalSetupState createState() => _ApprovalSetupState();
}

class _ApprovalSetupState extends State<ApprovalSetup> {
  String? selectedDepartment;
  String? selectedType;
  String? selectedCurrency;
  bool managementApprover = false;
  final TextEditingController flownameController = TextEditingController();
    List<Map<String, dynamic>> filterData = [];
    

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
   final List<String> _currencies = [
   'MMK','USD'
  ];

 final List<String> _type = [
   'Project','Trip','Operation'
  ];
  final List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> flows = [
    {
      'Flow Name': 'Adm Tst Flw 7',
      'Department': 'Admin',
      'Request Type': 'Project',
      'Currency': 'MMK',
      'Description': 'A Testing Flow For Admins 7',
      'No of Steps': '3',
      'Management': 'Yes',
      'Approvers': 'Aung',
     
    },
    {
      'Flow Name': 'Adm Tst Flw 8',
      'Department': 'Admin',
      'Request Type': 'Project',
      'Currency': 'USD',
      'Description': 'A Testing Flow For Admins 8',
      'No of Steps': '3',
      'Management': 'Yes',
      'Approvers': 'Khaung',
      
    },
    {
      'Flow Name': 'Engineer Tst Flw 7',
      'Department': 'Engineering',
      'Request Type': 'Project',
      'Currency': 'MMK',
      'Description': 'A Testing Flow For Engineer 7',
      'No of Steps': '3',
      'Management': 'Yes',
      'Approvers': 'Khant',
      'Action': '✓',
    },
    {
      'Flow Name': 'Engineer Tst Flw 8',
      'Department': 'Engineering',
      'Request Type': 'Project',
      'Currency': 'USD',
      'Description': 'A Testing Flow For Engineer 8',
      'No of Steps': '3',
      'Management': 'Yes',
      'Approvers': '✓',
      'Action': '✓',
    },
  ];
   void _addProject(List<Map<String, String>> newProject) {
    setState(() {
      flows.addAll(newProject);
    });
  }

  @override
  Widget build(BuildContext context) {
   
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Approval SetUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                SizedBox(
                 width: MediaQuery.of(context).size.width/5,// Adjust width as needed
                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: " Department",
                                      border: OutlineInputBorder()
                                    ),
                                    items: _departments.map((department) {
                                      return DropdownMenuItem(
                                          value: department,
                                          child: Text(department));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDepartment = value!;
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
                SizedBox(
                  width: MediaQuery.of(context).size.width/5,
                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Request Type",
                                      border: OutlineInputBorder()
                                    ),
                                    items: _type.map((type) {
                                      return DropdownMenuItem(
                                          value: type,
                                          child: Text(type));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Choose your Request Type";
                                      }
                                      return null;
                                    },
                                  ),
                ),
                SizedBox(
                width: MediaQuery.of(context).size.width/5,
                  child:DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Currency",
                                      border: OutlineInputBorder()
                                    ),
                                    items: _currencies.map((currency) {
                                      return DropdownMenuItem(
                                          value: currency,
                                          child: Text(currency));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedCurrency = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Choose your Currency";
                                      }
                                      return null;
                                    },
                                  ),
                ),
                SizedBox(
                width: MediaQuery.of(context).size.width/5,
                  child: TextFormField(
                    controller: flownameController,
                    decoration: InputDecoration(
                        labelText: 'Flow Name', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            
  Row(
              children: [
                Checkbox(
                  value: managementApprover,
                  onChanged: (value) => setState(() => managementApprover = value ?? false),
                ),
                Text('Management Approver'),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // Add your action here
                  },
                  icon: Icon(Icons.add, color: Colors.blue),
                  ),
                  IconButton(
                  onPressed: () {
                    // Add your action here
                  },
                  icon: Icon(Icons.refresh, color: Colors.blue),
                  ),
                  IconButton(
                  onPressed: () {
                    // Add your action here
                  },
                  icon: Icon(Icons.download, color: Colors.blue),
                  ),
                  
                  ],

  ),
            SizedBox(height: 10),
             Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: screenWidth,
                  child: Table(
                    border: const TableBorder.symmetric(
                      inside: BorderSide(color: Colors.grey, width: 1),
                      outside: BorderSide(color: Colors.grey, width: 1),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(0.6),
                      2: FlexColumnWidth(0.5),
                      3: FlexColumnWidth(0.4),
                      4: FlexColumnWidth(1.8),
                      5: FlexColumnWidth(0.5),
                      6: FlexColumnWidth(0.5),
                      7: FlexColumnWidth(0.7),
                      8: FlexColumnWidth(0.7),
                    },
                    children:  [
                      TableRow(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 167, 230, 232)),
                        children: [
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Flow Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Department', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Request Type', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Currency', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('No of Steps', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Management', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Approvers', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: const TableBorder.symmetric(
                    inside: BorderSide(color: Colors.grey, width: 1),
                    outside: BorderSide(color: Colors.black, width: 1),
                  ),
                  columnWidths: const {
                     0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(0.6),
                      2: FlexColumnWidth(0.5),
                      3: FlexColumnWidth(0.4),
                      4: FlexColumnWidth(1.8),
                      5: FlexColumnWidth(0.5),
                      6: FlexColumnWidth(0.5),
                      7: FlexColumnWidth(0.7),
                      8: FlexColumnWidth(0.7),
                    
                  },
                  children: flows.asMap().entries.map(
                    (entry) {
                      int index = entry.key;
                      var row = entry.value;

                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Flow Name'] ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Department'] ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Request Type'] ?? 'fd'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Currency'] ?? '0'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Description'] ?? 'USD'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['No of Steps'] ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Management'] ?? 'Pending'),
                          ),
                           Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Approvers', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => EditProject(
                                      //       projectData: projectData[index],
                                      //       onProjectUpdated: (updatedProject) {
                                      //         setState(() {
                                      //           _ProjectDetailState();
                                      //           _refreshData();
                                      //           projectData[index] =
                                      //               updatedProject;
                                      //         });
                                      //       },
                                    //       ),
                                    //     ),
                                    //   );
                                    // },
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black),
                                IconButton(
                                    onPressed: () {
                                      // _deleteConfirmation(
                                      //     projectData.indexOf(row));
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.black),
                               
                                IconButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         ProjectDetailPage(projectData: projectData[index],
                                //          selectedBudgetCodes: [],
                                //           selectedBudgetCode: '', 
                                //           budgetDetails: [], 
                                //         ),
                                //   ),
                                // );
                              },
                              icon: const Icon(Icons.more_horiz_outlined),
                              color: Colors.black),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          
          ],
        ),
      ),
      
    );
  }
}
