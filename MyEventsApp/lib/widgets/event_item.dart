import 'package:flutter/material.dart';
import 'package:myeventsapp/routes/route_constant.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final int id;
  final String title;
  final String venue;
  final String date;
  final String time;

  const EventItem({
    required this.id,
    required this.title,
    required this.venue,
    required this.date,
    required this.time,
  });

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, eventDetailRoute, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Hero(
                     tag: id,
                    child: Image.asset(
                      'assets/images/newevent.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black54,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range_rounded,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        FittedBox(
                          child: Text(
                            date,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        FittedBox(
                          child: Text(
                            time,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(height: 10, thickness: 1, color: Colors.grey),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        FittedBox(
                          child: Text(
                            venue,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
