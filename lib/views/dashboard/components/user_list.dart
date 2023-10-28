import 'package:flutter/material.dart';
import 'package:mk_mining_admin/models/all_user_mod.dart';
import 'package:mk_mining_admin/services/active_deactive_ser.dart';

class UserList extends StatefulWidget {
  const UserList({super.key, required this.allUsers, required this.token});
  final List<Datum> allUsers;
  final String token;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.allUsers.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (_, i) {
          final data = widget.allUsers[i];
          return Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Text(
                      data.name == null
                          ? "N"
                          : data.name!.characters.first.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name ?? "Null",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(data.email ?? 'Null'),
                        Text(
                          "Main: 500 | Mining: 01 | Team: 08",
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ),
                data.isActive == null
                    ? const SizedBox()
                    : Switch(
                        value: data.isActive == "0" ? false : true,
                        onChanged: (v) {
                          if (v) {
                            data.isActive = "1";
                          } else {
                            data.isActive = "0";
                          }
                          debugPrint("data.isActive: ${data.isActive}");

                          setState(() {});
                          activeDeactivateService(token: widget.token, id: data.id.toString());
                        }),
              ],
            ),
          );
        });
  }
}
