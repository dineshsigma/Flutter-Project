import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({super.key});

  @override
  State<DailyTask> createState() => _DailyTaskState();
}

var items = ['active', 'Deactive', 'In active', 'Present', 'Absent'];

class _DailyTaskState extends State<DailyTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(height: 10),
                const Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: Text(
                    'Team Meambers',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                DropdownButton(
                    value: 'active',
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {}),
              ],
            ),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Task ${index + 1}'),
                  subtitle: const Text('Description of the task'),
                );
              },
            ),
            // Expanded(
            //   child: ListView(
            //     children: const[
            //       Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage('https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp'),
            //           ),
            //           title: Text('Risa Pearson',style: TextStyle(fontSize: 16,color:Colors.black ),),
            //           subtitle: Text('UI/UX Designer'),
            //         ),
            //       ),ss
            //        Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage('https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp'),
            //           ),
            //           title: Text('Risa Pearson',style: TextStyle(fontSize: 16,color:Colors.black ),),
            //           subtitle: Text('UI/UX Designer'),
            //         ),
            //       ),
            //        Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage('https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp'),
            //           ),
            //           title: Text('Risa Pearson',style: TextStyle(fontSize: 16,color:Colors.black ),),
            //           subtitle: Text('UI/UX Designer'),
            //         ),
            //       ),
            //        Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage('https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp'),
            //           ),
            //           title: Text('Risa Pearson',style: TextStyle(fontSize: 16,color:Colors.black ),),
            //           subtitle: Text('UI/UX Designer'),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
